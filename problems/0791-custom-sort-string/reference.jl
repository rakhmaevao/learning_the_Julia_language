# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function custom_sort_string(S::String, T::String)
    letter_rank = fill(0, 128)
    for (idx, ch) in enumerate(codeunits(S))
        letter_rank[ch] = idx
    end
    u = codeunits(T)[:]
    sort!(u, by = x -> letter_rank[x])
    String(u)
end
