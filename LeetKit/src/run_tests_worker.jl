# Рабочий процесс: запускает тесты одной задачи и пишет JSON с результатом.
#   julia --project=. run_tests_worker.jl <dir> <mode> <json-out>
using LeetKit
using JSON3

dir, mode, jsonout = ARGS[1], ARGS[2], ARGS[3]
res = try
    LeetKit.run_tests_inprocess(dir; mode=mode)
catch err
    Dict{String,Any}("mode" => mode, "passed" => false, "n_pass" => 0, "n_fail" => 0,
                     "n_error" => 1, "n_broken" => 0, "time_ns" => 0, "bytes" => 0,
                     "details" => String[],
                     "error" => sprint(showerror, err, catch_backtrace()))
end
open(jsonout, "w") do io
    JSON3.write(io, res)
end
if res["passed"]
    println("\n✔ Тесты пройдены: $(res["n_pass"])")
else
    println("\n✘ Тесты не пройдены: ok=$(res["n_pass"]) fail=$(res["n_fail"]) error=$(res["n_error"])")
    isempty(res["error"]) || println(res["error"])
    for d in res["details"]
        println(d)
    end
end
