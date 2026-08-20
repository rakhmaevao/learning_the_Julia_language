# Агрегаты прогресса: календарь, серии, разбивка по сложности.

_date_of_solve(prog) = begin
    d = String(get(prog, "first_solved_at", ""))
    isempty(d) ? String(get(prog, "solved_at", "")) : d
end

function stats(probs::Vector{Problem}=load_problems())
    by_diff = Dict{String,Dict{String,Int}}()
    calendar = Dict{String,Vector{Dict{String,Any}}}()
    activity = Dict{String,Int}()
    total_solved = 0

    for p in probs
        prog = progress(p)
        d = difficulty(p)
        rec = get!(by_diff, d, Dict("total" => 0, "solved" => 0, "attempted" => 0))
        rec["total"] += 1
        st = status(p)
        st == "solved" && (rec["solved"] += 1; total_solved += 1)
        st == "attempted" && (rec["attempted"] += 1)

        if st == "solved"
            day = _date_of_solve(prog)
            if !isempty(day)
                push!(get!(calendar, day, Dict{String,Any}[]),
                      Dict{String,Any}("id" => id(p), "title" => title(p),
                                       "difficulty" => d, "slug" => p.meta["slug"]))
            end
        end
        for r in p.meta["runs"]
            at = String(get(r, "at", ""))
            isempty(at) && continue
            day = first(at, 10)
            activity[day] = get(activity, day, 0) + 1
        end
    end

    days = sort(collect(keys(calendar)))
    streak_cur, streak_best = 0, 0
    if !isempty(days)
        dates = sort(unique(Date.(days)))
        run_len = 1
        streak_best = 1
        for i in 2:length(dates)
            run_len = dates[i] - dates[i-1] == Day(1) ? run_len + 1 : 1
            streak_best = max(streak_best, run_len)
        end
        last = dates[end]
        today = Dates.today()
        if today - last <= Day(1)
            streak_cur = run_len
        end
    end

    return Dict{String,Any}(
        "total" => length(probs),
        "solved" => total_solved,
        "by_difficulty" => by_diff,
        "calendar" => calendar,
        "activity" => activity,
        "streak_current" => streak_cur,
        "streak_best" => streak_best,
        "today" => Dates.format(Dates.today(), "yyyy-mm-dd"),
    )
end
