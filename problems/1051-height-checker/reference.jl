# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function height_checker(heights::Vector{Int})
    sorted = sort(heights)
    return count(i -> heights[i] != sorted[i], 1:length(heights))
end
