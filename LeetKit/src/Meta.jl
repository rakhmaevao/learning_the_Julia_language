# Чтение/запись meta.toml и обход каталога problems/

const MAX_RUNS = 60

"""Корень проекта (каталог, в котором лежит `problems/`)."""
function project_root()
    r = get(ENV, "JULIALEET_ROOT", "")
    isempty(r) || return abspath(r)
    return abspath(joinpath(@__DIR__, "..", ".."))
end

problems_dir() = joinpath(project_root(), "problems")

struct Problem
    dir::String
    meta::Dict{String,Any}
end

Base.getindex(p::Problem, k::AbstractString) = p.meta[k]
id(p::Problem) = Int(p.meta["id"])
title(p::Problem) = String(p.meta["title"])
difficulty(p::Problem) = String(get(p.meta, "difficulty", "Unknown"))
progress(p::Problem) = p.meta["progress"]::Dict{String,Any}
status(p::Problem) = String(get(progress(p), "status", "todo"))

function read_meta(dir::AbstractString)
    f = joinpath(dir, "meta.toml")
    isfile(f) || error("нет meta.toml в $dir")
    m = TOML.parsefile(f)
    m["progress"] = get(m, "progress", Dict{String,Any}())
    m["runs"] = get(m, "runs", Any[])
    return m
end

function write_meta(dir::AbstractString, meta::Dict)
    f = joinpath(dir, "meta.toml")
    tmp = f * ".tmp"
    open(tmp, "w") do io
        TOML.print(io, meta; sorted=true)
    end
    mv(tmp, f; force=true)
    return f
end

"""Все задачи, отсортированные по номеру."""
function load_problems(; dir=problems_dir())
    isdir(dir) || return Problem[]
    res = Problem[]
    for d in readdir(dir; join=true)
        isdir(d) || continue
        isfile(joinpath(d, "meta.toml")) || continue
        try
            push!(res, Problem(d, read_meta(d)))
        catch err
            @warn "не удалось прочитать meta.toml" dir = d exception = err
        end
    end
    sort!(res; by=id)
    return res
end

"""Найти задачу по номеру, слагу или подстроке названия."""
function find_problem(query; dir=problems_dir())
    probs = load_problems(; dir=dir)
    q = strip(string(query))
    n = tryparse(Int, q)
    if n !== nothing
        i = findfirst(p -> id(p) == n, probs)
        i === nothing || return probs[i]
        error("задача с номером $n не найдена")
    end
    ql = lowercase(q)
    hits = filter(p -> occursin(ql, lowercase(p.meta["slug"])) ||
                       occursin(ql, lowercase(title(p))), probs)
    isempty(hits) && error("не найдено задач по запросу «$q»")
    length(hits) > 1 && length(hits) <= 10 &&
        @info "найдено несколько, беру первую" candidates = [string(id(p), " ", title(p)) for p in hits]
    return first(hits)
end

folder_name(p::Problem) = basename(p.dir)

"""Записать результат прогона тестов в meta.toml."""
function record_run!(p::Problem, result::Dict; mode::AbstractString="solution")
    meta = read_meta(p.dir)
    prog = meta["progress"]::Dict{String,Any}
    runs = meta["runs"]::Vector

    now_str = Dates.format(Dates.now(), "yyyy-mm-ddTHH:MM:SS")
    entry = Dict{String,Any}(
        "at" => now_str,
        "mode" => mode,
        "passed" => result["passed"] === true,
        "n_pass" => get(result, "n_pass", 0),
        "n_fail" => get(result, "n_fail", 0),
        "n_error" => get(result, "n_error", 0),
        "time_ns" => get(result, "time_ns", 0),
        "bytes" => get(result, "bytes", 0),
    )
    push!(runs, entry)
    length(runs) > MAX_RUNS && (meta["runs"] = runs[end-MAX_RUNS+1:end])

    if mode == "solution"
        prog["attempts"] = Int(get(prog, "attempts", 0)) + 1
        if entry["passed"]
            today = Dates.format(Dates.today(), "yyyy-mm-dd")
            prog["status"] = "solved"
            prog["solved_at"] = today
            isempty(String(get(prog, "first_solved_at", ""))) && (prog["first_solved_at"] = today)
            t = Int(entry["time_ns"])
            b = Int(entry["bytes"])
            bt = Int(get(prog, "best_time_ns", 0))
            bb = Int(get(prog, "best_bytes", 0))
            (bt == 0 || (t > 0 && t < bt)) && (prog["best_time_ns"] = t)
            (bb == 0 || (b > 0 && b < bb)) && (prog["best_bytes"] = b)
        elseif String(get(prog, "status", "todo")) != "solved"
            prog["status"] = "attempted"
        end
    end
    write_meta(p.dir, meta)
    return meta
end

"""Ручная отметка «решено» (с произвольной датой)."""
function mark_solved!(p::Problem; date::AbstractString=Dates.format(Dates.today(), "yyyy-mm-dd"), notes=nothing)
    meta = read_meta(p.dir)
    prog = meta["progress"]::Dict{String,Any}
    prog["status"] = "solved"
    prog["solved_at"] = String(date)
    isempty(String(get(prog, "first_solved_at", ""))) && (prog["first_solved_at"] = String(date))
    notes === nothing || (prog["notes"] = String(notes))
    write_meta(p.dir, meta)
    return meta
end

function set_status!(p::Problem, st::AbstractString)
    meta = read_meta(p.dir)
    prog = meta["progress"]::Dict{String,Any}
    prog["status"] = String(st)
    st == "todo" && (prog["solved_at"] = "")
    write_meta(p.dir, meta)
    return meta
end

function set_notes!(p::Problem, notes::AbstractString)
    meta = read_meta(p.dir)
    (meta["progress"]::Dict{String,Any})["notes"] = String(notes)
    write_meta(p.dir, meta)
    return meta
end

"""Вернуть solution.jl к исходному шаблону (старое решение уходит в .bak)."""
function reset_solution!(p::Problem)
    tmpl = joinpath(p.dir, "template.jl")
    sol = joinpath(p.dir, "solution.jl")
    isfile(tmpl) || error("нет template.jl в $(p.dir)")
    isfile(sol) && cp(sol, sol * ".bak"; force=true)
    cp(tmpl, sol; force=true)
    return sol
end
