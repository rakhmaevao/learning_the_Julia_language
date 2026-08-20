# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function xor_operation(n::Int, start::Int)
    res = 0
    for _ in 1:n
        res ⊻= start
        start += 2
    end
    return res
end
