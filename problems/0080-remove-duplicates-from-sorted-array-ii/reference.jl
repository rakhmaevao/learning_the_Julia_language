# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function remove_duplicates2!(nums::Vector{Int})::Int
    j = 3
    for i in 3:length(nums)
        if nums[i] != nums[j - 2]
            nums[j] = nums[i]
            j += 1
        end
    end

    return j - 1
end
