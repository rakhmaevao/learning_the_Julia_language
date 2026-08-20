# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function valid_square(ps::Vector{Vector{Int}})
    sort!(ps)
    ps[1] + ps[4] != ps[2] + ps[3] && return false
    sum((ps[1] .- ps[2]) .^ 2) != sum((ps[1] .- ps[3]) .^ 2) && return false
    return true
end
