# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function largest_perimeter(A::Vector{Int})
    sort!(A; rev=true)
    for i in 1:(length(A) - 2)
        (A[i] < A[i + 1] + A[i + 2]) && return A[i] + A[i + 1] + A[i + 2]
    end
    return 0
end
