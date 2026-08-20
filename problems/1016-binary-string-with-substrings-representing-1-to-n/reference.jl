# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function query_string(S::String, N::Int)
    m = (N >> 1) + 1
    for i in m:N
        s_bit = join(reverse!(digits(i; base=2)))
        !occursin(s_bit, S) && return false
    end
    return true
end
