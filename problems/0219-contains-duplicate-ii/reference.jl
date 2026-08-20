# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function contains_nearby_duplicate(nums::Vector{Int}, k::Int)::Bool
    pos = Dict{Int,Int}()
    for (i, num) in enumerate(nums)
        haskey(pos, num) && i - pos[num] <= k && return true
        pos[num] = i
    end
    return false
end
