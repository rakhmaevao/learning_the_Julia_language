# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function two_city_sched_cost(costs::Vector{Vector{Int}})::Int
    sort!(costs; by = x -> x[1] - x[2])
    n = length(costs) ÷ 2
    res = 0
    for i in 1:n
        res += costs[i][1] + costs[i + n][2]
    end
    res
end
