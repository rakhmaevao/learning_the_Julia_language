# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function busystudent(starttime::AbstractVector, endtime::AbstractVector, query::Int)
    return count(s ≤ query ≤ e for (s, e) in zip(starttime, endtime))
end
