# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function next_permutation(nums::Vector{Int})
    next_perm!(nums)
    return nums
end
