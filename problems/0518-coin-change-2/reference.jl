# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function change(amount::Int, coins::Vector{Int})::Int
    dp = fill(0, amount)

    for coin in coins, x in coin:amount
        dp[x] += (x == coin) ? 1 : dp[x - coin]
    end

    return dp[amount]
end
