# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function occurrences_after_bigram(text::String, first::String, second::String)
    words = split(text)
    res = String[]
    for i in 1:length(words)-2
        if words[i] == first && words[i+1] == second
            push!(res, words[i+2])
        end
    end
    return res
end
