# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function distribute_candies(candies::Int, npeople::Int)
    res = fill(0, npeople)
    cur = 1
    while candies != 0
        tmp = min(cur, candies)
        res[mod1(cur, npeople)] += tmp
        candies -= tmp
        cur += 1
    end
    return res
end
