# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function search_bst(root::TreeNode, val::Int)::Union{TreeNode,Nothing}
    while !isnothing(root)
        root.val == val && return root
        root = (root.val > val) ? root.left : root.right
    end
end
