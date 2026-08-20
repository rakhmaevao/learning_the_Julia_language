# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function least_bricks(wall::Vector{Vector{Int}})
    tb = Dict{Int,Int}()
    for row in wall
        acc = 0
        for i in @view(row[1:(end - 1)])
            acc += i
            haskey(tb, acc) ? tb[acc] += 1 : tb[acc] = 1
        end
    end
    isempty(tb) && return length(wall)
    return length(wall) - maximum(values(tb))
end
