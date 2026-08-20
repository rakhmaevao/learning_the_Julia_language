# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_subarray_productLess_than_k(nums::Vector{Int}, k::Int)
    k <= 1 && return 0
    res, left = 0, 1
    p = 1
    for (right, val) in enumerate(nums)
        p *= val
        while p >= k
            p ÷= nums[left]
            left += 1
        end
        res += right - left + 1
    end
    return res
end
