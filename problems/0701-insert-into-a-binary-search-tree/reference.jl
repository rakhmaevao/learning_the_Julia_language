# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

insert_into_bst(::Nothing, val::Int) = TreeNode(val)
function insert_into_bst(root::TreeNode, val::Int)::TreeNode
    if root.val > val
        root.left = insert_into_bst(root.left, val)
    else
        root.right = insert_into_bst(root.right, val)
    end
    return root
end
