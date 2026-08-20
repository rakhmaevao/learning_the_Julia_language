# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function nth_ugly_number(n::Int)
    dp = Vector{Int}(undef, n)
    p2 = p3 = p5 = dp[1] = 1
    for i in 2:n
        nums = dp[p2] * 2, dp[p3] * 3, dp[p5] * 5
        dp[i] = minimum(nums)
        p2 += dp[i] == nums[1]
        p3 += dp[i] == nums[2]
        p5 += dp[i] == nums[3]
    end
    return dp[n]
end
