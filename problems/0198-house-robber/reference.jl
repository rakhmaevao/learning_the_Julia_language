# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function rob_198(nums::Vector{Int})::Int
    n = length(nums)
    n == 1 && return nums[1]
    first, second = nums[1], max(nums[1], nums[2])
    for num in @view nums[3:end]
        first, second = second, max(second, first + num)
    end
    return second
end
