#!/usr/bin/env julia
# Импорт задач из репозитория JuliaCN/LeetCode.jl в локальную структуру problems/<NNNN>-<slug>/
#
#   julia --project=. tools/import_problems.jl <путь-к-клону-LeetCode.jl> [--force]

using TOML
using Dates

const ROOT = abspath(joinpath(@__DIR__, ".."))
const OUT = joinpath(ROOT, "problems")

struct Parsed
    id::Int
    slug::String
    title::String
    difficulty::String
    categories::Vector{String}
    link::String
    author::String
    source_date::String
    statement::String
    code::String
end

strip_comment(line) = startswith(line, "# ") ? line[3:end] : (line == "#" ? "" : line)

function parse_problem(path::String)::Union{Parsed,Nothing}
    fname = basename(path)
    m = match(r"^(\d+)\.(.+)\.jl$", fname)
    m === nothing && return nothing
    id = parse(Int, m.captures[1])
    slug = m.captures[2]

    lines = readlines(path)
    # --- шапка с метаданными ---
    meta = Dict{String,String}()
    i = 1
    n = length(lines)
    while i <= n && !startswith(strip(lines[i]), "# ---")
        i += 1
    end
    i += 1
    while i <= n && !startswith(strip(lines[i]), "# ---")
        kv = match(r"^#\s*([A-Za-z_]+):\s*(.*)$", lines[i])
        if kv !== nothing
            meta[lowercase(kv.captures[1])] = strip(kv.captures[2])
        end
        i += 1
    end
    i += 1

    # --- текст условия ---
    stmt = String[]
    while i <= n && !startswith(lines[i], "## @lc code=start")
        push!(stmt, strip_comment(rstrip(lines[i])))
        i += 1
    end
    i += 1

    # --- код эталонного решения ---
    code = String[]
    while i <= n && !startswith(lines[i], "## @lc code=end")
        push!(code, rstrip(lines[i]))
        i += 1
    end

    title = get(meta, "title", "$id. $slug")
    title = replace(title, r"^\s*\d+\.\s*" => "")
    link = strip(get(meta, "link", ""), ['<', '>'])
    if isempty(link)
        link = "https://leetcode.com/problems/$slug/"
    end
    cats = filter(!isempty, strip.(split(get(meta, "categories", ""), ",")))

    return Parsed(
        id, slug, title,
        get(meta, "difficulty", "Unknown"),
        String.(cats),
        String(link),
        get(meta, "author", ""),
        get(meta, "date", ""),
        strip(join(stmt, "\n")) * "\n",
        strip(join(code, "\n")) * "\n",
    )
end

"""Убрать зависимость от пакета LeetCode, заменив её на LeetKit.Support."""
function rewrite_usings(code::String)
    out = String[]
    for line in split(code, "\n")
        s = strip(line)
        if s == "using LeetCode"
            continue
        elseif startswith(s, "using LeetCode,")
            push!(out, "using" * s[length("using LeetCode,")+1:end])
        elseif startswith(s, "using LeetCode:")
            continue
        else
            push!(out, String(line))
        end
    end
    String(strip(join(out, "\n")))
end

sig_of(e::Expr) =
    if e.head === :function || e.head === :(=)
        e.args[1]
    else
        nothing
    end

is_funcdef(e) = false
function is_funcdef(e::Expr)
    (e.head === :function) && return true
    if e.head === :(=)
        lhs = e.args[1]
        lhs isa Expr || return false
        h = lhs.head
        if h === :call
            return true
        elseif h === :where || h === :(::)
            inner = lhs.args[1]
            return inner isa Expr && (inner.head === :call || inner.head === :where ||
                                      (inner.head === :(::) && inner.args[1] isa Expr && inner.args[1].head === :call))
        end
    end
    return false
end

func_name(sig) = begin
    while sig isa Expr && sig.head in (:where, :(::))
        sig = sig.args[1]
    end
    if sig isa Expr && sig.head === :call
        f = sig.args[1]
        f isa Expr && f.head === :(::) && (f = f.args[end])
        f isa Symbol ? String(f) : string(f)
    else
        ""
    end
end

"""Собрать шаблон: сигнатуры сохранены, тела заменены заглушкой."""
function make_template(code::String)
    parsed = try
        Meta.parseall(code)
    catch err
        return (nothing, String[])
    end
    pieces = String[]
    names = String[]
    for e in parsed.args
        e isa LineNumberNode && continue
        e isa Expr || continue
        ex = Base.remove_linenums!(deepcopy(e))
        if is_funcdef(ex)
            sig = string(sig_of(ex))
            nm = func_name(sig_of(ex))
            isempty(nm) || push!(names, nm)
            push!(pieces, """
function $sig
    # TODO: напишите своё решение
    error("Задача ещё не решена: $nm")
end""")
        else
            push!(pieces, replace(string(ex), r"#=[^=]*=# ?" => ""))
        end
    end
    isempty(names) && return (nothing, String[])
    return (join(pieces, "\n\n") * "\n", unique(names))
end

function main()
    src_repo = length(ARGS) >= 1 ? abspath(ARGS[1]) : error("укажите путь к клону LeetCode.jl")
    force = "--force" in ARGS
    src_dir = joinpath(src_repo, "src", "problems")
    test_dir = joinpath(src_repo, "test", "problems")
    isdir(src_dir) || error("не найден каталог $src_dir")

    mkpath(OUT)
    imported = 0
    skipped = String[]
    for f in sort(readdir(src_dir))
        f == "problems.jl" && continue
        endswith(f, ".jl") || continue
        p = parse_problem(joinpath(src_dir, f))
        p === nothing && (push!(skipped, "$f: имя файла"); continue)
        tf = joinpath(test_dir, f)
        isfile(tf) || (push!(skipped, "$f: нет тестов"); continue)

        code = rewrite_usings(p.code)
        tmpl, names = make_template(code)
        tmpl === nothing && (push!(skipped, "$f: не разобран код"); continue)

        dirname_ = joinpath(OUT, string(lpad(p.id, 4, '0'), "-", p.slug))
        exists = isdir(dirname_)
        mkpath(dirname_)

        write(joinpath(dirname_, "README.md"),
              "# $(p.id). $(p.title)\n\n" *
              "**Сложность:** $(p.difficulty)  \n" *
              "**Темы:** $(isempty(p.categories) ? "—" : join(p.categories, ", "))  \n" *
              "**LeetCode:** $(p.link)\n\n---\n\n" * p.statement)

        write(joinpath(dirname_, "template.jl"),
              "# Шаблон решения задачи $(p.id). $(p.title)\n" *
              "# Запуск тестов:  ./leet test $(p.id)\n\n" *
              "using LeetKit.Support\n\n" * tmpl)

        write(joinpath(dirname_, "reference.jl"),
              "# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl\n\n" *
              "using LeetKit.Support\n\n" * code * "\n")

        tests = read(tf, String)
        write(joinpath(dirname_, "test.jl"), tests)

        sol = joinpath(dirname_, "solution.jl")
        if !isfile(sol) || force
            write(sol, read(joinpath(dirname_, "template.jl"), String))
        end

        metafile = joinpath(dirname_, "meta.toml")
        if !isfile(metafile) || force
            meta = Dict{String,Any}(
                "id" => p.id,
                "slug" => p.slug,
                "title" => p.title,
                "difficulty" => p.difficulty,
                "categories" => p.categories,
                "link" => p.link,
                "entrypoints" => names,
                "source" => Dict{String,Any}(
                    "repo" => "https://github.com/JuliaCN/LeetCode.jl",
                    "author" => p.author,
                    "date" => p.source_date,
                ),
                "progress" => Dict{String,Any}(
                    "status" => "todo",
                    "attempts" => 0,
                    "solved_at" => "",
                    "first_solved_at" => "",
                    "best_time_ns" => 0,
                    "best_bytes" => 0,
                    "notes" => "",
                ),
                "runs" => Dict{String,Any}[],
            )
            open(metafile, "w") do io
                TOML.print(io, meta; sorted=true)
            end
        end
        imported += 1
        exists || nothing
    end
    println("Импортировано задач: $imported")
    if !isempty(skipped)
        println("Пропущено: $(length(skipped))")
        for s in first(skipped, 20)
            println("  - $s")
        end
    end
end

main()
