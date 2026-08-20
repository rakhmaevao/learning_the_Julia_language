# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

peak_index_in_mountain_array(arr) =
    searchsortedfirst(1:(length(arr) - 1), length(arr) - 1; by=i -> arr[i] > arr[i + 1])
