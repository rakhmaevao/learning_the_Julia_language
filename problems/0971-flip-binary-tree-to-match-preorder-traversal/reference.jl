# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function flip_match_voyage(root::TreeNode, voyage::Vector{Int})
    res = Int[]
    i = 1
    dfs(::Nothing) = nothing
    function dfs(node::TreeNode)
        if node.val != voyage[i]
            res = [-1]
            return
        end
        i += 1
        if i ≤ length(voyage) && node.left !== nothing && node.left.val != voyage[i]
            push!(res, node.val)
            dfs(node.right)
            dfs(node.left)
        else
            dfs(node.left)
            dfs(node.right)
        end
    end
    dfs(root)
    return (!isempty(res) && res[1] == -1) ? [-1] : res
end
