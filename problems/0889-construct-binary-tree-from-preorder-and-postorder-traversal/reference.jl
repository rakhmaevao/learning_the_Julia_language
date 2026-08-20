# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function construct_from_pre_post(pre::Vector{Int}, post::Vector{Int})
    if isempty(pre)
        return nothing
    end
    root = TreeNode(pre[1])
    if length(pre) == 1
        return root
    end
    idx = findfirst(==(pre[2]), post)
    root.left = construct_from_pre_post(pre[2:1+idx], post[1:idx])
    root.right = construct_from_pre_post(pre[2+idx:end], post[1+idx:end-1])
    root
end
