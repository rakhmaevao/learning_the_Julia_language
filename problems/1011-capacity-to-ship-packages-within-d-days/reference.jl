# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function ship_within_days(weights::Vector{Int}, D::Int)
    lo, hi = maximum(weights), sum(weights)
    while lo < hi
        mid = (lo + hi) ÷ 2
        cnt = 1
        tt = 0
        for w in weights
            tt += w
            if tt > mid
                cnt += 1
                tt = w
            end
        end
        cnt > D ? (lo = mid + 1) : (hi = mid)
    end
    return lo
end
