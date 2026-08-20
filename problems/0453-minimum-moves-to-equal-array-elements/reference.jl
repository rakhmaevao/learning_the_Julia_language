# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_moves_453(nums::Vector{Int})
    sum(nums) - minimum(nums) * length(nums)
end
