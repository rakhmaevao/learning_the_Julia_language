# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

using OffsetArrays
function largest_number(cost::Vector{Int}, target::Int)::BigInt
    dp = OffsetArray(fill(typemin(Int), target + 1), -1)
    dp[0] = 0
    for c in cost, j in c:target
        dp[j] = max(dp[j], dp[j - c] + 1)
    end
    res = big(0)
    dp[end] < 0 && return res
    for i in 9:-1:1
        c = cost[i]
        while target >= c && dp[target] == dp[target - c] + 1
            res = res * 10 + i
            target -= c
        end
    end
    return res
end
