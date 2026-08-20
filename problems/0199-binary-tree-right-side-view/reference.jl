# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function right_side_view(root::TreeNode{Int})::Vector{Int}
    q = Queue{Pair{TreeNode{Int}, Int}}()
    res = Int[]
    enqueue!(q, Pair(root, 1))
    while !isempty(q)
        nd, layer = dequeue!(q)
        (nd.left !== nothing) && enqueue!(q, Pair(nd.left, layer + 1))
        (nd.right !== nothing) && enqueue!(q, Pair(nd.right, layer + 1))
        (isempty(q) || layer < first(q).second) && (push!(res, nd.val))
    end
    res
end
