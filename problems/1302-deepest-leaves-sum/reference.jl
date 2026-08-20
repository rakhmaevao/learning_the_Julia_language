# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function deepest_leaves_sum(root::TreeNode)::Int
    nodes = [root]
    while true
        val = 0
        for _ in eachindex(nodes)
            node = popfirst!(nodes)
            val += node.val
            isnothing(node.left) || push!(nodes, node.left)
            isnothing(node.right) || push!(nodes, node.right)
        end
        isempty(nodes) && return val
    end
end
