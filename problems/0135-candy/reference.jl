# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function candy(ratings::Vector{Int})::Int
    sizes = length(ratings)
    if sizes < 2
        return sizes
    end

    nums = ones(Int, sizes)
    ## from left to right
    for i in 2: sizes
        if ratings[i] > ratings[i - 1]
            nums[i] = nums[i - 1] + 1
        end
    end

    ## from right to left
    for i in sizes: -1: 2
        if ratings[i] < ratings[i - 1]
            nums[i - 1] = max(nums[i - 1], nums[i] + 1)
        end
    end

    return sum(nums)
end
