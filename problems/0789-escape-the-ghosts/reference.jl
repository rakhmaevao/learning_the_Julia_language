# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function escape_ghosts(ghosts::Vector{Vector{Int}}, target::Vector{Int})
    dist1 = sum(abs, target)
    dist2 = minimum(sum(abs, g .- target) for g in ghosts)
    return dist1 < dist2
end
