# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_smallest_set_of_vertices(n::Int, edges::Vector{Vector{Int}})::Vector{Int}
    set = Set(edge[2] for edge in edges)
    res = Int[]
    for i in 0:n-1
        (i in set) || push!(res, i)
    end
    res
end
