# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_longest_chain(intervals::Vector{Tuple{Int,Int}})
    isempty(intervals) && return 0
    sort!(intervals; by=x -> x[2])
    lst, res = intervals[1][2], 1
    for intv in intervals
        intv[1] <= lst && continue
        res += 1
        lst = intv[2]
    end
    return res
end
