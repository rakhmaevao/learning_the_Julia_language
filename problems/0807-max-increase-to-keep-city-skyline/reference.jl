# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_increase_keeping_skyline(grid::Matrix{Int})
    n = size(grid, 1)
    col_max = maximum(grid; dims=1)
    row_max = maximum(grid; dims=2)
    res = 0
    for i in 1:n, j in 1:n
        res += min(row_max[i], col_max[j]) - grid[i, j]
    end
    return res
end
