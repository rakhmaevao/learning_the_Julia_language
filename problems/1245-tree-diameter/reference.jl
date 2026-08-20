# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function tree_diameter(edges::Vector{Vector{Int}})
    n = length(edges)
    neighbors = Dict(i => Int[] for i in 0:n)
    for edge in edges
        u, v = edge
        push!(neighbors[u], v)
        push!(neighbors[v], u)
    end

    function depth_first(node, neighbors)
        # (current length, current node)
        longest = (0, node)

        # each tuple is (current length, current node, previous node)
        todo = [(longest..., -1)]
        while !isempty(todo)
            len, this, prev = pop!(todo)
            if len > longest[1]
                longest = (len, this)
            end

            for next in neighbors[this]
                next == prev && continue
                push!(todo, (len + 1, next, this))
            end
        end

        return longest
    end

    # we find one "end" of the eventual chain by doing depth first once
    # and a second time starting from the known end
    _, one_end = depth_first(0, neighbors)
    diameter, _ = depth_first(one_end, neighbors)

    return diameter
end
