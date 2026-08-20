# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function findContentChildren(g::Vector{Int}, s::Vector{Int})::Int
    sort!(g)
    sort!(s)

    child, cookie = 1, 1

    while child <= length(g) && cookie <= length(s)
        if g[child] <= s[cookie]
            child += 1
        end
        cookie += 1
    end

    return child - 1
end
