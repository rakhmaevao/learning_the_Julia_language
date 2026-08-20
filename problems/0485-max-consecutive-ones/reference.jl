# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_max_consecutive_ones(nums::Vector{Int})
    cnt, tmp = 0, 0
    for num in nums
        num == 1 ? tmp += 1 : tmp = 0
        cnt = max(tmp, cnt)
    end
    return max(tmp, cnt)
end
