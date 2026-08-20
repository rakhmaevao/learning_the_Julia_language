# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function partition_disjoint(nums::Vector{Int})
    n, pos = length(nums), 0
    maxn = leftm = nums[1]
    for i in 2:n
        maxn = max(maxn, nums[i])
        if nums[i] < leftm
            leftm = maxn
            pos = i
        end
    end
    return pos
end
