# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function has_alternating_bits(n::Int)::Bool
    a = (n >> 1) ⊻ n
    return a & (a + 1) == 0
end
