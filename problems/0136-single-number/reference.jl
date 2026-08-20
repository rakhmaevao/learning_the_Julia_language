# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

single_number_136(nums::Vector{Int}) = reduce(⊻, nums)
