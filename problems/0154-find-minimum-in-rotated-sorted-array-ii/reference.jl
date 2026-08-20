# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_min_154(nums::Vector{Int})
    left, right = 1, length(nums)
    while left < right
        mid = (left + right) ÷ 2
        if nums[mid] > nums[right]
            left = mid + 1
        elseif nums[mid] < nums[right]
            right = mid
        else
            right -= 1
        end
    end
    nums[left]
end
