# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function shifting_letters(s::String, shift::Vector{Int})::String
    for i in length(shift):-1:2
        shift[i - 1] += shift[i]
    end
    res = codeunits(s)[:]
    for i in 1:length(shift)
        res[i] += shift[i]
    end
    return String(res)
end
