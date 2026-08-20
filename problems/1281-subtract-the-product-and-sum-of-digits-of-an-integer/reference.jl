# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

subtract_prod_sum(n::Int) = prod(digits(n)) - sum(digits(n))
