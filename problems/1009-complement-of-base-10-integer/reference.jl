# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function bitwise_complement(N::Int)
    res = 0
    for i in 0:31
        if N > 0
            res += ((1 - (N & 1)) << i)
            N >>= 1
        else
            return res
        end
    end
end
