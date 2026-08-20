# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function search_insert(nums::Vector{Int}, target::Int)::Int
    left, right = 1, length(nums)
    while left <= right
        mid = left + ((right - left) >> 1)
        if nums[mid] >= target
            right = mid - 1
        else
            left = mid + 1
        end
    end
    return left - 1
end
