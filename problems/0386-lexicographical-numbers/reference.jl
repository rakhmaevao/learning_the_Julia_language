# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function lexical_order(n)
    res = Vector{Int}(undef, n)
    cur = 1
    for i in 1:n
        res[i] = cur
        if 10cur <= n
            cur *= 10
        else
            (cur >= n) && (cur ÷= 10)
            cur += 1
            while cur % 10 == 0
                cur ÷= 10
            end
        end
    end
    return res
end
