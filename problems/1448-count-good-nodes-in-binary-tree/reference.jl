# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function good_nodes(root::TreeNode)::Int
    dfs(::Nothing, args...) = 0
    function dfs(n::TreeNode, mval::Int)::Int
        res = 0
        (n.val >= mval) && (res += 1)
        n_max = max(mval, n.val)
        res += dfs(n.left, n_max)
        res += dfs(n.right, n_max)
        return res
    end
    return dfs(root, typemin(Int))
end
