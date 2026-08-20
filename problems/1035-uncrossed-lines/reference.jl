# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

max_uncrossed_lines(nums1::Vector{Int}, nums2::Vector{Int}) =
    longest_common_subsequence(nums1, nums2)
