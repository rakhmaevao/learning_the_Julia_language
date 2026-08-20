# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

## Dynamic Programming
function min_cost_climbing_stairs(cost::Vector{Int})::Int
    first, second = cost[1], cost[2]
    for c in @view cost[3:end]
        first, second = second, min(first, second) + c
    end
    return min(first, second)
end
