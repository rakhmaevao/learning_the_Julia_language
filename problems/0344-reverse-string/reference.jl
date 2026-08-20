# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function reverse_string!(s::Vector{Char})::Nothing
    n = length(s)
    for i in 1:(n ÷ 2)
        s[i], s[end - i + 1] = s[end - i + 1], s[i]
    end
    return nothing
end
