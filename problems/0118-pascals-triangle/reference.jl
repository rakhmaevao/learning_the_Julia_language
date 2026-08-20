# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

pascals_triangle(numRows::Int) = [[binomial(k, i) for i in 0:k] for k in 0:(numRows - 1)]
