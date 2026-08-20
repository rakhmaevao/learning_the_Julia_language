# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

remove_palindromic_subsequences(s::String) = (s == reverse(s)) ? 1 : 2
