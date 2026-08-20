# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_falling_path_sum(matrix::Vector{Vector{Int}})::Int
    n = length(matrix)
    function f(l1, l2)
        return [
            num + minimum(l1[max(i - 1, 1):min(i + 1, n)]) for (i, num) in enumerate(l2)
        ]
    end
    return minimum(foldl(f, matrix))
end
