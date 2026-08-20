# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function maximum_subarray(nums::Vector{Int})::Int
    pre, max_res = 0, nums[1]
    for num in nums
        pre = max(pre + num, num)
        max_res = max(pre, max_res)
    end
    return max_res
end
