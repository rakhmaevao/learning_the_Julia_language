# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function array_pair_sum(nums::Vector{Int})
    sort!(nums)
    sum(nums[1:2:end])
end
