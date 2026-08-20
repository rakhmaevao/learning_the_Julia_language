# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function best_rotation(nums::Vector{Int})::Int
    n = length(nums)
    diffs = fill(0, n)
    for (i, num) in enumerate(nums)
        diffs[mod(i - num - 1, n) + 1] -= 1
        diffs[i] += 1
    end
    ans = maxscore = score = 0
    for (i, num) in enumerate(@view(diffs[1:(end - 1)]))
        score += num
        if score > maxscore
            maxscore, ans = score, i
        end
    end
    return ans
end
