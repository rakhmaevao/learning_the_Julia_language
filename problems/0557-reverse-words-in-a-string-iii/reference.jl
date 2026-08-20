# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

reverse_words_557(s::String) = join([reverse(i) for i in split(s)], " ")
