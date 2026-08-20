# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function base_neg2(N::Int)
    cnt = 0
    res = ""
    while N > 0
        bit = (N & 1)
        N -= bit * (-1) ^ cnt
        N >>= 1
        cnt += 1
        res = string(bit) * res
    end
    res
end
