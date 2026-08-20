# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

trim_BST(::Nothing, L::Int, R::Int) = nothing

function trim_BST(root::TreeNode{Int}, L::Int, R::Int)
    root.val > R && return trim_BST(root.left, L, R)
    root.val < L && return trim_BST(root.right, L, R)
    root.left = trim_BST(root.left, L, R)
    root.right = trim_BST(root.right, L, R)
    return root
end
