# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function smallest_rangeII(nums::Vector{Int}, k::Integer)
    sort!(nums)
    res = nums[end] - nums[1]
    for i in 2:length(nums)
        res = min(res, max(nums[end] - k, nums[i - 1] + k) - min(nums[1] + k, nums[i] - k))
    end
    return res
end
