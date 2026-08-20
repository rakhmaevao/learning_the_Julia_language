# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function remove_duplicates(S::String)::String
    stk = Char[]

    for ch in S
        if !isempty(stk) && stk[end] == ch
            pop!(stk)
        else
            push!(stk, ch)
        end
    end

    return join(stk)
end
