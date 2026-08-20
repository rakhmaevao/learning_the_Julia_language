# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_coins(piles::Vector{Int})
    len = length(sort!(piles))
    return sum(piles[i] for i in len ÷ 3 + 1 : 2 : len - 1)
end
