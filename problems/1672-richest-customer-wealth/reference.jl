# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function maximumWealth(accounts::Array{<:Integer,2})::Int
    return maximum(sum(accounts; dims=2))
end
