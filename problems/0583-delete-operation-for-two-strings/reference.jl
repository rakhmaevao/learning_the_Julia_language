# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

min_distance583(word1::String, word2::String) =
    length(word2) + length(word2) - 2longest_common_subsequence(word1, word2)
