# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_min_height_trees(n::Int, edges::Vector{Vector{Int}})
    (n == 1) && return [1]
    neighbor = [Set{Int}() for i in 1:n]
    for (u, v) in edges
        push!(neighbor[u], v)
        push!(neighbor[v], u)
    end
    q = [i for i in 1:n if length(neighbor[i]) == 1]
    dep_q = ones(Int, size(q))
    m_dep = 1
    visited = fill(false, n)
    visited[q] .= true
    res = q[:]
    while !isempty(q)
        u, dep = popfirst!(q), popfirst!(dep_q)
        for nei in neighbor[u]
            visited[nei] && continue
            visited[nei] = true
            push!(q, nei)
            push!(dep_q, dep + 1)
        end
        if dep > m_dep
            m_dep = dep
            res = [u; q]
        end
    end
    return res
end
