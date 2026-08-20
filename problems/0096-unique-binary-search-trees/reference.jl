# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

num_of_trees(n::Int) = binomial(2 * n, n) - binomial(2 * n, n + 1)
