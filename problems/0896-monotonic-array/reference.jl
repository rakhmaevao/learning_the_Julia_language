# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_monotonic(A::Vector{Int})
    return issorted(A) || issorted(A; rev = true)
end
