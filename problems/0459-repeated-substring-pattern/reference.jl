# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function repeated_substring_pattern(s::String)
    findnext(s, s^2, 2) != length(s) + 1 : 2 * length(s)
end
