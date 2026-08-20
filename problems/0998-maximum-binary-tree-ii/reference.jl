# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function insert_into_max_tree(root::TreeNode{Int}, val::Int)
    tmp = TreeNode(val)
    if val > root.val
        tmp.left = root
        return tmp
    end
    root.right = insert_into_max_tree(root.right, val)
    return root
end
insert_into_max_tree(::Nothing, val::Int) = TreeNode(val)
