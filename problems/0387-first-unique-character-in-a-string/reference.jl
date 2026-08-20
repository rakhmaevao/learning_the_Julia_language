# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function first_unique_char(s::String)::Int
    table = Dict{Char,Bool}()
    for i in s
        table[i] = !haskey(table, i)
    end
    for (i, st) in enumerate(s)
        table[st] && return i
    end
    -1
end
