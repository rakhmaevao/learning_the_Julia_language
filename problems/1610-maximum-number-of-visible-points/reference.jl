# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_visible_points(points::Vector{Vector{Int}}, view_angle::Int,
                            location::Vector{Int})
    points .-= Ref(location)
    len = length(points)
    angles = [atand(point...) for point in points if point != [0, 0]]
    res, samen = 0, len - length(angles)
    sort!(angles)
    angles = vcat(angles, angles .+ 360)
    for i in 1:length(angles)÷2
        idx = searchsortedlast(@view(angles[i+1:end]), angles[i] + view_angle)
        res = max(res, idx+1+samen)
    end
    res
end
