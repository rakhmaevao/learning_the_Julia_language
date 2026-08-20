# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

running_sum(arr::Vector{<:Number}) = cumsum!(arr, arr)
