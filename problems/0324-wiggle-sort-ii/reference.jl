# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function wiggle_sort!(nums::Vector{Int})
    len = length(nums)
    md = len ÷ 2
    partialsort!(nums, md)
    nums[1], nums[md] = nums[md], nums[1]
    i, j = 2, len
    iseven(len) && (j -= 1)
    while i <= j
        nums[i], nums[j] = nums[j], nums[i]
        i += 2
        j -= 2
    end
    return nums
end
