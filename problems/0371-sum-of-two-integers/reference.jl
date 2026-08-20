# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function get_sum371(a::Int, b::Int)::Int
    while b != 0
        carry = (a & b) << 1
        a = a ⊻ b
        b = carry
    end
    a
end
