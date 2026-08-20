# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function count_bits(num::Int)
    res = fill(1, num)
    for i in 2:num
        res[i] = res[i >> 1] + (i & 1)
    end
    pushfirst!(res, 0)
end
