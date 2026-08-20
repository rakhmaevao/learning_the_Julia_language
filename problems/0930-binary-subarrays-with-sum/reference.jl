# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_subarrays_with_sum(nums::Vector{Int}, goal::Int)
    cnt = OffsetArray(fill(0, length(nums) + 1), -1)
    s, res = 0, 0
    for num in nums
        cnt[s] += 1
        s += num
        res += get(cnt, s - goal, 0)
    end
    res
end
