# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_equal_rows_after_flips(mat::Matrix{Int})
    mp = Dict{Vector{Int}, Int}()
    for row in eachrow(mat)
        row[1] == 1 && (row .= 1 .- row)
        mp[row] = get(mp, row, 0) + 1
    end
    return maximum(values(mp))
end
