# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function rotate_48(matrix::Matrix{Int})
    n = size(matrix, 1)
    for i in 1:div(n, 2), j in i:(n - i)
        matrix[i, j], matrix[j, n + 1 - i], matrix[n + 1 - i, n + 1 - j], matrix[n + 1 - j, i] = matrix[
            n + 1 - j, i
        ],
        matrix[i, j], matrix[j, n + 1 - i],
        matrix[n + 1 - i, n + 1 - j]
    end
    return matrix
end
