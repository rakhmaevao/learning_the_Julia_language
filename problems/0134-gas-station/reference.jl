# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function can_complete_circuit(gas::Vector{Int}, cost::Vector{Int})
    gas .-= cost
    accumulate!(+, gas, gas)
    if gas[end] < 0
        return -1
    end
    return argmin(gas) % length(gas)
end
