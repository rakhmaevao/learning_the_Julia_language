# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

bst_to_gst(::Nothing) = nothing
function bst_to_gst(root::TreeNode{Int})::TreeNode{Int}
    s = 0
    rev_first_ord(::Nothing) = nothing
    function rev_first_ord(node::TreeNode{Int})
        rev_first_ord(node.right)
        s += node.val
        node.val = s
        return rev_first_ord(node.left)
    end
    rev_first_ord(root)
    return root
end
