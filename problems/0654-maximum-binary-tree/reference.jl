# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function construct_maximum_binary_tree(nums::AbstractVector{Int})
    isempty(nums) && return nothing
    max_idx = argmax(nums)
    return TreeNode(nums[max_idx],
                    construct_maximum_binary_tree(@view(nums[1:(max_idx - 1)])),
                    construct_maximum_binary_tree(@view(nums[(max_idx + 1):end])))
end
