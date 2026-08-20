# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_area_of_container(height::Vector{Int})::Int
    i, j, res = 1, length(height), 0
    while i < j
        res = max(res, min(height[i], height[j]) * (j - i))
        height[i] < height[j] ? (i += 1) : (j -= 1)
    end
    return res
end
