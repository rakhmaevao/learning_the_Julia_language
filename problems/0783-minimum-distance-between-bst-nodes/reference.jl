# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_diff_in_bst(root::TreeNode)
    prev, ans = typemin(Int) >> 1, typemax(Int)
    function dfs(root::TreeNode)
        (root.left !== nothing) && (dfs(root.left))
        ans = min(root.val - prev, ans)
        prev = root.val
        (root.right !== nothing) && (dfs(root.right))
    end
    dfs(root)
    ans
end
