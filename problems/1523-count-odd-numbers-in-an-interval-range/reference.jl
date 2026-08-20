# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

count_odd_numbers(low::Int, high::Int) = (high - low + 1 + (low & 1)) >> 1
