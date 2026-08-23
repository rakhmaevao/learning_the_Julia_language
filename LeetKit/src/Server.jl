# HTTP-сервер с веб-интерфейсом прогресса.

const ASSETS = joinpath(@__DIR__, "..", "assets")

_json(x; status=200) = HTTP.Response(status,
    ["Content-Type" => "application/json; charset=utf-8",
     "Cache-Control" => "no-store"],
    JSON3.write(x))

_read_file(path) = isfile(path) ? read(path, String) : ""

function _brief(p::Problem)
    prog = progress(p)
    runs = p.meta["runs"]
    last_run = isempty(runs) ? "" : String(get(runs[end], "at", ""))
    Dict{String,Any}(
        "id" => id(p),
        "slug" => p.meta["slug"],
        "title" => title(p),
        "difficulty" => difficulty(p),
        "categories" => get(p.meta, "categories", String[]),
        "link" => get(p.meta, "link", ""),
        "folder" => folder_name(p),
        "dir" => p.dir,
        "status" => status(p),
        "solved_at" => get(prog, "solved_at", ""),
        "first_solved_at" => get(prog, "first_solved_at", ""),
        "attempts" => get(prog, "attempts", 0),
        "best_time_ns" => get(prog, "best_time_ns", 0),
        "best_bytes" => get(prog, "best_bytes", 0),
        "notes" => get(prog, "notes", ""),
        "last_run_at" => last_run,
        "reference_ok" => get(p.meta, "reference_ok", true),
    )
end

function _full(p::Problem)
    d = _brief(p)
    md = _read_file(joinpath(p.dir, "README.md"))
    sep = findfirst("\n---\n", md)          # шапка уже показана в карточке — оставляем только условие
    sep === nothing || (md = md[last(sep)+1:end])
    d["statement_html"] = try
        sprint(show, MIME"text/html"(), Markdown.parse(md))
    catch
        "<pre>" * HTTP.escapehtml(md) * "</pre>"
    end
    d["solution"] = _read_file(joinpath(p.dir, "solution.jl"))
    d["template"] = _read_file(joinpath(p.dir, "template.jl"))
    d["test"] = _read_file(joinpath(p.dir, "test.jl"))
    d["reference"] = _read_file(joinpath(p.dir, "reference.jl"))
    d["runs"] = p.meta["runs"]
    d["entrypoints"] = get(p.meta, "entrypoints", String[])
    return d
end

_body_json(req) = isempty(req.body) ? Dict{String,Any}() :
                  copy(JSON3.read(String(req.body), Dict{String,Any}))

function _problem_by_id(n::Int)
    for p in load_problems()
        id(p) == n && return p
    end
    return nothing
end

function handle(req::HTTP.Request)
    path = HTTP.URI(req.target).path
    method = req.method
    try
        if method == "GET" && (path == "/" || path == "/index.html")
            html = _read_file(joinpath(ASSETS, "index.html"))
            return HTTP.Response(200, ["Content-Type" => "text/html; charset=utf-8"], html)
        elseif method == "GET" && path == "/api/problems"
            return _json(Dict("problems" => [_brief(p) for p in load_problems()]))
        elseif method == "GET" && path == "/api/stats"
            return _json(stats())
        elseif startswith(path, "/api/problems/")
            parts = split(strip(path, '/'), '/')          # api problems <id> [action]
            n = tryparse(Int, parts[3])
            n === nothing && return _json(Dict("error" => "плохой номер"); status=400)
            p = _problem_by_id(n)
            p === nothing && return _json(Dict("error" => "задача $n не найдена"); status=404)
            action = length(parts) >= 4 ? String(parts[4]) : ""

            if method == "GET" && action == ""
                return _json(_full(p))
            elseif method == "POST" && action == "run"
                body = _body_json(req)
                mode = String(get(body, "mode", "solution"))
                timeout = Float64(get(body, "timeout", 60))
                result, log = run_tests(p.dir; mode=mode, timeout=timeout)
                record_run!(p, result; mode=mode)
                fresh = _problem_by_id(n)
                return _json(Dict("result" => result, "log" => log,
                                  "problem" => _brief(fresh)))
            elseif method == "POST" && action == "solve"
                body = _body_json(req)
                date = String(get(body, "date", Dates.format(Dates.today(), "yyyy-mm-dd")))
                mark_solved!(p; date=date, notes=get(body, "notes", nothing))
                return _json(_brief(_problem_by_id(n)))
            elseif method == "POST" && action == "status"
                body = _body_json(req)
                set_status!(p, String(get(body, "status", "todo")))
                return _json(_brief(_problem_by_id(n)))
            elseif method == "POST" && action == "notes"
                body = _body_json(req)
                set_notes!(p, String(get(body, "notes", "")))
                return _json(_brief(_problem_by_id(n)))
            elseif method == "POST" && action == "reset"
                reset_solution!(p)
                return _json(_full(_problem_by_id(n)))
            elseif method == "POST" && action == "open"
                ok = try
                    run(Cmd(`xdg-open $(p.dir)`; detach=true); wait=false)
                    true
                catch
                    false
                end
                return _json(Dict("ok" => ok, "dir" => p.dir))
            end
        end
        return _json(Dict("error" => "нет такого маршрута: $method $path"); status=404)
    catch err
        @error "ошибка обработки запроса" path exception = (err, catch_backtrace())
        return _json(Dict("error" => sprint(showerror, err)); status=500)
    end
end

"""
    serve(; port=8083, host="127.0.0.1", open_browser=true)

Поднять веб-интерфейс прогресса.
"""
function serve(; port::Int=8083, host::AbstractString="127.0.0.1", open_browser::Bool=true)
    url = "http://$host:$port"
    println("JuliaLeet UI: $url")
    println("Каталог задач: $(problems_dir())")
    println("Остановить: Ctrl-C")
    if open_browser
        @async begin
            sleep(1.0)
            try
                run(Cmd(`xdg-open $url`; detach=true); wait=false)
            catch
            end
        end
    end
    HTTP.serve(handle, host, port)
end
