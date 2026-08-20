# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

unique_paths(m::Int, n::Int) = binomial(m + n - 2, n - 1)
