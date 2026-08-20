# Запуск тестов задачи: в текущем процессе и в отдельном процессе (с таймаутом).

function _count_results!(acc, ts)
    if hasproperty(ts, :n_passed)
        acc[:pass] += ts.n_passed
    end
    results = hasproperty(ts, :results) ? ts.results : ()
    for r in results
        if r isa Test.Pass
            acc[:pass] += 1
        elseif r isa Test.Fail
            acc[:fail] += 1
            push!(acc[:details], sprint(show, r))
        elseif r isa Test.Error
            acc[:error] += 1
            push!(acc[:details], sprint(show, r))
        elseif r isa Test.Broken
            acc[:broken] += 1
        elseif r isa Test.AbstractTestSet
            _count_results!(acc, r)
        end
    end
    return acc
end

"""
    run_tests_inprocess(dir; mode="solution")

Выполняет `test.jl` задачи поверх `solution.jl` (или `reference.jl`) в отдельном
анонимном модуле. Возвращает `Dict` с итогами и метриками.
"""
function run_tests_inprocess(dir::AbstractString; mode::AbstractString="solution")
    srcfile = joinpath(dir, mode == "reference" ? "reference.jl" : "solution.jl")
    testfile = joinpath(dir, "test.jl")
    isfile(srcfile) || error("нет файла $srcfile")
    isfile(testfile) || error("нет файла $testfile")

    res = Dict{String,Any}(
        "mode" => mode, "passed" => false, "n_pass" => 0, "n_fail" => 0,
        "n_error" => 0, "n_broken" => 0, "time_ns" => 0, "bytes" => 0,
        "details" => String[], "error" => "",
    )

    sandbox = Module(gensym(:Sandbox))
    Core.eval(sandbox, :(using LeetKit.Support))
    Core.eval(sandbox, :(using Test))

    try
        Base.include(sandbox, srcfile)
    catch err
        res["error"] = "Ошибка загрузки $(basename(srcfile)):\n" * sprint(showerror, err)
        res["n_error"] = 1
        return res
    end

    ts = Test.DefaultTestSet(basename(dir))
    Test.push_testset(ts)
    try
        Base.include(sandbox, testfile)
    catch err
        if err isa Test.TestSetException
            # результаты уже собраны в ts
        else
            res["error"] = "Ошибка выполнения тестов:\n" * sprint(showerror, err, catch_backtrace())
            res["n_error"] += 1
        end
    finally
        Test.pop_testset()
    end

    acc = Dict(:pass => 0, :fail => 0, :error => 0, :broken => 0, :details => String[])
    _count_results!(acc, ts)
    res["n_pass"] = acc[:pass]
    res["n_fail"] += acc[:fail]
    res["n_error"] += acc[:error]
    res["n_broken"] = acc[:broken]
    res["details"] = acc[:details]
    res["passed"] = isempty(res["error"]) && res["n_fail"] == 0 && res["n_error"] == 0 && res["n_pass"] > 0

    # Замер: повторный прогон уже скомпилированного кода.
    if res["passed"]
        try
            GC.gc()
            b0 = Base.gc_bytes()
            t0 = time_ns()
            quiet = Test.DefaultTestSet("bench")
            Test.push_testset(quiet)
            try
                Base.include(sandbox, testfile)
            finally
                Test.pop_testset()
            end
            res["time_ns"] = Int(time_ns() - t0)
            res["bytes"] = Int(Base.gc_bytes() - b0)
        catch
            # замер не критичен
        end
    end
    return res
end

const RUNNER_SCRIPT = joinpath(@__DIR__, "run_tests_worker.jl")

"""
    run_tests(dir; mode="solution", timeout=60)

Запускает тесты в отдельном процессе Julia (защита от зависаний и от засорения
текущей сессии). Возвращает `(result::Dict, log::String)`.
"""
function run_tests(dir::AbstractString; mode::AbstractString="solution", timeout::Real=60)
    jsonout = tempname() * ".json"
    logfile = tempname() * ".log"
    cmd = `$(Base.julia_cmd()) --startup-file=no --color=no --project=$(project_root()) $(RUNNER_SCRIPT) $(abspath(dir)) $(mode) $(jsonout)`
    proc = run(pipeline(cmd; stdout=logfile, stderr=logfile); wait=false)

    timedout = false
    t0 = time()
    while process_running(proc)
        if time() - t0 > timeout
            timedout = true
            kill(proc, Base.SIGKILL)
            break
        end
        sleep(0.05)
    end
    wait(proc)

    log = isfile(logfile) ? read(logfile, String) : ""
    result = if isfile(jsonout)
        try
            copy(JSON3.read(read(jsonout, String), Dict{String,Any}))
        catch
            nothing
        end
    else
        nothing
    end
    if result === nothing
        result = Dict{String,Any}(
            "mode" => mode, "passed" => false, "n_pass" => 0, "n_fail" => 0,
            "n_error" => 1, "n_broken" => 0, "time_ns" => 0, "bytes" => 0,
            "details" => String[],
            "error" => timedout ? "Превышен лимит времени ($(timeout) с) — возможно, бесконечный цикл." :
                       "Процесс тестирования завершился аварийно.",
        )
    end
    result["timed_out"] = timedout
    rm(jsonout; force=true)
    rm(logfile; force=true)
    return result, log
end

"""Запустить тесты и сразу записать результат в meta.toml."""
function run_and_record!(p::Problem; mode::AbstractString="solution", timeout::Real=60)
    result, log = run_tests(p.dir; mode=mode, timeout=timeout)
    record_run!(p, result; mode=mode)
    return result, log
end
