# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function first_missing_positive(nums::Vector{Int})
    len = length(nums)
    for idx in 1:len
        while nums[idx] <= len && nums[idx] > 0 && nums[nums[idx]] != nums[idx]
            num = nums[idx]
            nums[idx], nums[num] = nums[num], nums[idx]
        end
    end
    for i in 1:len
        (nums[i] != i) && return i
    end
end
