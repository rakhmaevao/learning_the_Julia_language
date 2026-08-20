# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function flip_and_invert_image(A::Vector{Vector{Int}})::Vector{Vector{Int}}
    m = length(A)
    for i = 1:m
        reverse!(A[i]) .⊻= 1
    end

    return A
end
