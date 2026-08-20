# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_ancestor_diff(root::TreeNode{Int})
    res = 0
    function min_max_descendant(root::TreeNode{Int})
        minres, maxres = root.val, root.val
        for child in (:left, :right)
            cd_node = getproperty(root, child)
            isnothing(cd_node) && continue
            minl, maxl = min_max_descendant(cd_node)
            res = max(res, abs(root.val - minl), abs(root.val - maxl))
            minres = min(minres, minl)
            maxres = max(maxres, maxl)
        end
        return minres, maxres
    end
    min_max_descendant(root)
    return res
end
