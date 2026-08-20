# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_width_of_vertical_area(points::Vector{Vector{Int}})
    sort!(points)
    return maximum(points[i][1] - points[i - 1][1] for i in 2 : length(points))
end
