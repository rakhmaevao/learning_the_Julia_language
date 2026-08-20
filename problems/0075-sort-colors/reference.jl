# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function sort_colors!(nums::Vector{Int})
    left = 1
    for i in eachindex(nums)
        if nums[i] == 0
            nums[i], nums[left] = nums[left], nums[i]
            left += 1
        end
    end
    for i in (left + 1):length(nums)
        if nums[i] == 1
            nums[i], nums[left] = nums[left], nums[i]
            left += 1
        end
    end
end
