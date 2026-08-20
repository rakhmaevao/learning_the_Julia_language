# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_circle_num(is_connected::Vector{Vector{Int}})
    len = length(is_connected)
    djst = IntDisjointSets(len)
    for i in 1:len, j in (i + 1):len
        (is_connected[i][j] == 1) && (root_union!(djst, i, j))
    end
    return djst.ngroups
end
