# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function reverse_words(s::String)
    s_s = split(s, " ", keepempty = false)
    join(reverse(s_s), " ")
end
