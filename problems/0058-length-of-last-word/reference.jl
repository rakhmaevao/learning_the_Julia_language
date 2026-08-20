# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

length_of_last_word(s::String) = length(rsplit(s, ' '; limit = 2, keepempty=false)[end])
