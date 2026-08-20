# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

last_remaining(n::Int)::Int = n == 1 ? 1 : 2 * (n ÷ 2 + 1 - last_remaining(n ÷ 2))
