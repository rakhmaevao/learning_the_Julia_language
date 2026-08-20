# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function transpose_matrix(matrix::Vector{Vector{Int}})::Vector{Vector{Int}}
    m, n = length(matrix), length(matrix[1])

    transpose_mat = [[0 for _ = 1:m] for _ = 1:n]

    for i = 1:m, j = 1:n
        transpose_mat[j][i] = matrix[i][j]
    end

    return transpose_mat
end
