# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function check_straight_line(coordinates::Vector{Vector{Int}})::Bool
    coordinates .-= Ref(coordinates[1])
    slope = coordinates[2][1]//coordinates[2][2]
    for i in 3:length(coordinates)
        (coordinates[i][1]//coordinates[i][2] != slope) && (return false)
    end
    return true
end
