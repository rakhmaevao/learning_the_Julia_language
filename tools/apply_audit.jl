#!/usr/bin/env julia
# Помечает в meta.toml задачи, чей эталон из upstream не проходит собственные тесты,
# и пишет отчёт docs/reference-audit.md.
#   julia --project=. tools/apply_audit.jl <audit_results.txt>

using LeetKit, TOML

file = ARGS[1]
rows = [split(l, '\t') for l in readlines(file) if !isempty(l)]
bad = Dict{Int,NamedTuple}()
for r in rows
    r[2] == "BAD" || continue
    bad[parse(Int, r[1])] = (n_pass=r[3], n_fail=r[4], n_error=r[5], title=r[7])
end

probs = load_problems()
for p in probs
    meta = LeetKit.read_meta(p.dir)
    isbad = haskey(bad, LeetKit.id(p))
    if isbad
        meta["reference_ok"] = false
    else
        delete!(meta, "reference_ok")
    end
    LeetKit.write_meta(p.dir, meta)
end

mkpath(joinpath(LeetKit.project_root(), "docs"))
open(joinpath(LeetKit.project_root(), "docs", "reference-audit.md"), "w") do io
    println(io, "# Проверка эталонных решений\n")
    println(io, "Прогон `test.jl` поверх `reference.jl` для всех $(length(rows)) задач ",
                "на Julia $(VERSION).\n")
    println(io, "Не проходят: **$(length(bad))**. У этих задач сломан именно импортированный ",
                "эталон (upstream JuliaCN/LeetCode.jl), условие и тесты рабочие.\n")
    println(io, "| # | Задача | ok | fail | error |")
    println(io, "|---|--------|----|------|-------|")
    for k in sort(collect(keys(bad)))
        v = bad[k]
        println(io, "| $k | $(v.title) | $(v.n_pass) | $(v.n_fail) | $(v.n_error) |")
    end
end
println("Помечено задач: ", length(bad))
