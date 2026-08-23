# Командная строка: ./leet <команда> ...

const C_RESET = "\e[0m"
const C_DIM = "\e[2m"
const C_BOLD = "\e[1m"
const C_GREEN = "\e[32m"
const C_YELLOW = "\e[33m"
const C_RED = "\e[31m"
const C_BLUE = "\e[34m"
const C_MAGENTA = "\e[35m"

_diff_color(d) = d == "Easy" ? C_GREEN : d == "Medium" ? C_YELLOW : d == "Hard" ? C_RED : C_DIM
_status_mark(s) = s == "solved" ? "$(C_GREEN)✔$(C_RESET)" :
                  s == "attempted" ? "$(C_YELLOW)~$(C_RESET)" : "$(C_DIM)·$(C_RESET)"

function _fmt_time(ns)
    ns = Int(ns)
    ns == 0 && return "—"
    ns < 1_000 && return "$(ns) ns"
    ns < 1_000_000 && return string(round(ns / 1_000; digits=1), " µs")
    ns < 1_000_000_000 && return string(round(ns / 1_000_000; digits=1), " ms")
    return string(round(ns / 1_000_000_000; digits=2), " s")
end

function _fmt_bytes(b)
    b = Int(b)
    b == 0 && return "—"
    units = ["B", "KiB", "MiB", "GiB"]
    i = 1
    x = float(b)
    while x >= 1024 && i < length(units)
        x /= 1024
        i += 1
    end
    return string(round(x; digits=1), " ", units[i])
end

function _parse_flags(args)
    flags = Dict{String,String}()
    rest = String[]
    for a in args
        if startswith(a, "--")
            kv = split(a[3:end], "="; limit=2)
            flags[String(kv[1])] = length(kv) == 2 ? String(kv[2]) : "true"
        else
            push!(rest, String(a))
        end
    end
    return flags, rest
end

function cmd_list(args)
    flags, rest = _parse_flags(args)
    probs = load_problems()
    st = get(flags, "status", "")
    df = get(flags, "difficulty", get(flags, "d", ""))
    tag = get(flags, "tag", "")
    q = lowercase(get(flags, "search", isempty(rest) ? "" : rest[1]))
    isempty(st) || filter!(p -> status(p) == st, probs)
    isempty(df) || filter!(p -> lowercase(difficulty(p)) == lowercase(df), probs)
    isempty(tag) || filter!(p -> any(c -> occursin(lowercase(tag), lowercase(c)),
                                     get(p.meta, "categories", String[])), probs)
    isempty(q) || filter!(p -> occursin(q, lowercase(title(p))) ||
                               occursin(q, lowercase(p.meta["slug"])), probs)
    limit = parse(Int, get(flags, "limit", "40"))
    total = length(probs)
    for p in first(probs, limit)
        prog = progress(p)
        d = difficulty(p)
        println(rpad(string(_status_mark(status(p)), " ", C_BOLD, lpad(id(p), 4), C_RESET), 22),
                rpad(title(p), 52),
                _diff_color(d), rpad(d, 8), C_RESET,
                C_DIM, get(prog, "solved_at", ""), C_RESET)
    end
    total > limit && println("$(C_DIM)… ещё $(total - limit). Уточните фильтр или --limit=$(total)$(C_RESET)")
    println("$(C_DIM)Показано $(min(limit, total)) из $(total)$(C_RESET)")
end

function cmd_show(args)
    p = find_problem(args[1])
    prog = progress(p)
    println("$(C_BOLD)$(id(p)). $(title(p))$(C_RESET)")
    println("Сложность: $(_diff_color(difficulty(p)))$(difficulty(p))$(C_RESET)")
    println("Темы: ", join(get(p.meta, "categories", String[]), ", "))
    println("Ссылка: ", get(p.meta, "link", ""))
    println("Статус: ", status(p), "  попыток: ", get(prog, "attempts", 0),
            "  решено: ", isempty(String(get(prog, "solved_at", ""))) ? "—" : get(prog, "solved_at", ""))
    println("Лучшее время: ", _fmt_time(get(prog, "best_time_ns", 0)),
            "  память: ", _fmt_bytes(get(prog, "best_bytes", 0)))
    println("Каталог: $(p.dir)")
    println()
    println(read(joinpath(p.dir, "README.md"), String))
end

function cmd_test(args)
    flags, rest = _parse_flags(args)
    isempty(rest) && error("укажите номер задачи: ./leet test 1")
    p = find_problem(rest[1])
    mode = haskey(flags, "reference") ? "reference" : "solution"
    timeout = parse(Float64, get(flags, "timeout", "60"))
    println("$(C_BOLD)$(id(p)). $(title(p))$(C_RESET)  [$(mode)]")
    result, log = run_tests(p.dir; mode=mode, timeout=timeout)
    record_run!(p, result; mode=mode)
    isempty(strip(log)) || println(strip(log))
    println()
    if result["passed"] === true
        println("$(C_GREEN)✔ Все тесты пройдены$(C_RESET) ($(result["n_pass"]) шт.), ",
                "время $(_fmt_time(result["time_ns"])), память $(_fmt_bytes(result["bytes"]))")
        mode == "solution" && println("$(C_DIM)Отмечено как решённое: $(Dates.format(Dates.today(), "yyyy-mm-dd"))$(C_RESET)")
    else
        println("$(C_RED)✘ Есть ошибки$(C_RESET): ok=$(result["n_pass"]) fail=$(result["n_fail"]) error=$(result["n_error"])")
    end
    return result["passed"] === true
end

function cmd_solve(args)
    flags, rest = _parse_flags(args)
    p = find_problem(rest[1])
    date = get(flags, "date", Dates.format(Dates.today(), "yyyy-mm-dd"))
    mark_solved!(p; date=date, notes=get(flags, "note", nothing))
    println("$(C_GREEN)✔$(C_RESET) $(id(p)). $(title(p)) — отмечена решённой $(date)")
end

function cmd_reset(args)
    p = find_problem(args[1])
    f = reset_solution!(p)
    println("solution.jl восстановлен из шаблона (копия старого — solution.jl.bak): $f")
end

function cmd_path(args)
    p = find_problem(args[1])
    println(p.dir)
end

function cmd_open(args)
    p = find_problem(args[1])
    println(p.dir)
    ed = get(ENV, "EDITOR", "")
    try
        if !isempty(ed)
            run(`$(Base.shell_split(ed)) $(joinpath(p.dir, "solution.jl"))`)
        else
            run(Cmd(`xdg-open $(p.dir)`; detach=true); wait=false)
        end
    catch err
        println("$(C_YELLOW)не удалось открыть: $(sprint(showerror, err))$(C_RESET)")
    end
end

function cmd_stats(_args)
    s = stats()
    println("$(C_BOLD)Прогресс$(C_RESET): $(s["solved"]) / $(s["total"]) задач")
    for d in ("Easy", "Medium", "Hard")
        haskey(s["by_difficulty"], d) || continue
        r = s["by_difficulty"][d]
        println("  ", _diff_color(d), rpad(d, 8), C_RESET,
                lpad(r["solved"], 4), " / ", rpad(r["total"], 5),
                C_DIM, " в работе: ", r["attempted"], C_RESET)
    end
    println("Серия: текущая $(s["streak_current"]) дн., лучшая $(s["streak_best"]) дн.")
    cal = s["calendar"]
    if !isempty(cal)
        println("\n$(C_BOLD)Последние дни$(C_RESET)")
        for day in last(sort(collect(keys(cal))), 10)
            items = cal[day]
            println("  $(C_BLUE)$day$(C_RESET): ",
                    join([string(i["id"], " ", i["title"], " (", i["difficulty"], ")") for i in items], "; "))
        end
    end
end

function cmd_random(args)
    flags, _ = _parse_flags(args)
    probs = load_problems()
    st = get(flags, "status", "todo")
    isempty(st) || filter!(p -> status(p) == st, probs)
    df = get(flags, "difficulty", "")
    isempty(df) || filter!(p -> lowercase(difficulty(p)) == lowercase(df), probs)
    isempty(probs) && (println("нет подходящих задач"); return)
    p = probs[rand(1:length(probs))]
    println("$(C_BOLD)$(id(p)). $(title(p))$(C_RESET) [$(difficulty(p))]")
    println(p.dir)
end

"""Создать каталог для своей задачи: ./leet new 9001 my-task --title="Моя задача" --difficulty=Medium"""
function cmd_new(args)
    flags, rest = _parse_flags(args)
    length(rest) >= 2 || error("использование: ./leet new <номер> <slug> [--title=...] [--difficulty=Easy] [--tags=Array,Math]")
    n = parse(Int, rest[1])
    slug = rest[2]
    title_ = get(flags, "title", replace(slug, "-" => " "))
    diff = get(flags, "difficulty", "Unknown")
    tags = filter(!isempty, strip.(split(get(flags, "tags", ""), ",")))
    dir = joinpath(problems_dir(), string(lpad(n, 4, '0'), "-", slug))
    isdir(dir) && error("каталог уже существует: $dir")
    mkpath(dir)
    write(joinpath(dir, "README.md"), "# $n. $title_\n\n**Сложность:** $diff\n\n---\n\nОписание задачи.\n")
    write(joinpath(dir, "template.jl"), "using LeetKit.Support\n\nfunction solve(x)\n    error(\"Задача ещё не решена\")\nend\n")
    cp(joinpath(dir, "template.jl"), joinpath(dir, "solution.jl"))
    write(joinpath(dir, "reference.jl"), "using LeetKit.Support\n\n# эталонного решения нет\n")
    write(joinpath(dir, "test.jl"), "@testset \"$n. $title_\" begin\n    @test solve(1) == 1\nend\n")
    meta = Dict{String,Any}(
        "id" => n, "slug" => slug, "title" => title_, "difficulty" => diff,
        "categories" => String.(tags), "link" => "", "entrypoints" => ["solve"],
        "progress" => Dict{String,Any}("status" => "todo", "attempts" => 0, "solved_at" => "",
                                       "first_solved_at" => "", "best_time_ns" => 0,
                                       "best_bytes" => 0, "notes" => ""),
        "runs" => Dict{String,Any}[],
    )
    open(joinpath(dir, "meta.toml"), "w") do io
        TOML.print(io, meta; sorted=true)
    end
    println("Создано: $dir")
end

function cmd_ui(args)
    flags, _ = _parse_flags(args)
    port = parse(Int, get(flags, "port", "8083"))
    serve(; port=port, open_browser=!haskey(flags, "no-open"))
end

const HELP = """
$(C_BOLD)JuliaLeet$(C_RESET) — тренировка на задачах LeetCode на Julia

  ./leet ui [--port=8083] [--no-open]   веб-интерфейс: таблица задач, фильтры, календарь
  ./leet list [запрос] [--status=todo|attempted|solved] [--difficulty=Easy]
              [--tag=Array] [--limit=40]
  ./leet show <номер>                   условие задачи и статистика
  ./leet test <номер> [--reference] [--timeout=60]
                                        прогнать тесты (успех = отметка «решено»)
  ./leet solve <номер> [--date=ГГГГ-ММ-ДД] [--note="..."]
  ./leet reset <номер>                  вернуть solution.jl к шаблону
  ./leet open <номер>                   открыть каталог задачи (\$EDITOR или xdg-open)
  ./leet path <номер>                   путь к каталогу задачи
  ./leet new <номер> <slug> [--title=...] [--difficulty=Easy] [--tags=Array,Math]
                                        каркас для своей задачи
  ./leet random [--difficulty=Easy] [--status=todo]
  ./leet stats                          сводка прогресса
"""

function main(args=ARGS)
    isempty(args) && (println(HELP); return 0)
    cmd = args[1]
    rest = args[2:end]
    try
        if cmd in ("ui", "serve", "web")
            cmd_ui(rest)
        elseif cmd in ("list", "ls")
            cmd_list(rest)
        elseif cmd in ("show", "info")
            cmd_show(rest)
        elseif cmd in ("test", "t", "run")
            return cmd_test(rest) ? 0 : 1
        elseif cmd in ("solve", "done")
            cmd_solve(rest)
        elseif cmd == "new"
            cmd_new(rest)
        elseif cmd == "reset"
            cmd_reset(rest)
        elseif cmd == "open"
            cmd_open(rest)
        elseif cmd == "path"
            cmd_path(rest)
        elseif cmd in ("stats", "progress")
            cmd_stats(rest)
        elseif cmd == "random"
            cmd_random(rest)
        elseif cmd in ("help", "-h", "--help")
            println(HELP)
        else
            println("неизвестная команда: $cmd\n")
            println(HELP)
            return 2
        end
    catch err
        err isa InterruptException && return 130
        println(stderr, "$(C_RED)Ошибка:$(C_RESET) ", sprint(showerror, err))
        return 1
    end
    return 0
end
