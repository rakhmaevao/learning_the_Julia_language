# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_moves2(nums::Vector{Int})
    median = partialsort!(nums, (length(nums) + 1) ÷ 2)
    return sum(abs, num - median for num in nums)
end
