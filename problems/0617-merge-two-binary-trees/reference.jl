# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

merge_trees(::Nothing, ::Nothing) = nothing
merge_trees(::Nothing, root2::TreeNode) = root2
merge_trees(root1::TreeNode, ::Nothing) = root1
function merge_trees(root1::TreeNode, root2::TreeNode)::TreeNode
    root = TreeNode(root1.val + root2.val)
    root.left = merge_trees(root1.left, root2.left)
    root.right = merge_trees(root1.right, root2.right)
    return root
end
