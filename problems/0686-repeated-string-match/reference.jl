# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function repeated_string_match(a::String, b::String)
    minres = (length(b) - 1) ÷ length(a) + 1
    s = a ^ minres
    for i in 0:2
        occursin(b, s) && return minres + i
        s *= a
    end
    return -1
end
