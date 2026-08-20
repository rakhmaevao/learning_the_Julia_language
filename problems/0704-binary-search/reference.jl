# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function search704(nums::Vector{Int}, target::Int)
    res = searchsortedfirst(nums, target)
    nums[res] == target ? res : 0
end
