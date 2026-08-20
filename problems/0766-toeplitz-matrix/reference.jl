# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_toeplitz_matrix(matrix::Vector{Vector{Int}})
    m, n = length(matrix), length(matrix[1])

    for i in 1:(m - 1)
        (matrix[i][1:(end - 1)] != matrix[i + 1][2:end]) && return false
    end

    return true
end
