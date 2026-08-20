# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

using DataStructures
function largest_sum_after_k_negations(A::Vector{Int}, K::Int)
    total = sum(A)
    pq = BinaryMinHeap(A)
    for _ in 1:K
        m = pop!(pq)
        total -= 2 * m
        push!(pq, -m)
    end
    total
end
