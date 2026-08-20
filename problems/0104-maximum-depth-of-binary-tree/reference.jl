# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

maximum_depth_of_btree(::Nothing) = 0
function maximum_depth_of_btree(root::TreeNode)
    return maximum(maximum_depth_of_btree, [root.left, root.right]) + 1
end
