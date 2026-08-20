# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_paths(m, n, N, i, j)
    dp = zeros(Int, m, n)
    t = copy(dp)
    for _ in 1:N
        inds = CartesianIndices(t)
        for x in inds
            v = 0
            for dir in ((0, -1), (0, 1), (1, 0), (-1, 0))
                p = x + CartesianIndex(dir)
                v += p ∈ inds ? t[p] : 1
            end
            dp[x] = v
        end
        dp, t = t, dp
    end
    return t[i, j] % (10^9 + 7)
end
