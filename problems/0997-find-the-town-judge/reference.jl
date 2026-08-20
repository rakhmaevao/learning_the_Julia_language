# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_judge(N::Int, trust::Vector{Vector{Int}})
    cnt = fill(0, N)
    for t in trust
        cnt[t[1]] -= 1
        cnt[t[2]] += 1
    end
    res = findfirst(==(N - 1), cnt)
    return isnothing(res) ? -1 : res
end
