# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_profit_121(prices::Vector{Int})::Int
    min_cost, profit = prices[1], 0
    for price in @view prices[2:end]
        profit = max(profit, price - min_cost)
        min_cost = min(min_cost, price)
    end
    return profit
end
