# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function remove_duplicates1!(nums::Vector{Int})::Int
    j = 2
    for i in 2: length(nums)
        if nums[i] != nums[j - 1]
            nums[j] = nums[i]
            j += 1
        end
    end

    return j - 1
end
