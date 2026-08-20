# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function hamming_distance(x::Int, y::Int)
    res = 0
    while x != 0 || y != 0
        res += (x & 1) ⊻ (y & 1)
        x >>= 1
        y >>= 1
    end
    res
end
