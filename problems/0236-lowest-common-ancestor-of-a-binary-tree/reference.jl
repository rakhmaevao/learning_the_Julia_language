# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function lowest_common_ancestor_236(
    root::TreeNode{Int}, p::TreeNode{Int}, q::TreeNode{Int}
)::TreeNode{Int}
    function dfs(node::Union{TreeNode{Int},Nothing})
        (isnothing(node) || node == p || node == q) && return node
        left, right = dfs(node.left), dfs(node.right)
        isnothing(left) && isnothing(right) && return nothing
        !isnothing(left) && !isnothing(right) && return node
        return !isnothing(left) ? left : right
    end
    return dfs(root)
end
