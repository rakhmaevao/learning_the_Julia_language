# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

find_peak_element(nums::Vector{Int}) = argmax(nums) - 1
