# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function flip_lights(n::Int, m::Int)
    n = min(n, 3)
    m == 0 && return 1
    m == 1 && return [2, 3, 4][n]
    m == 2 && return [2, 4, 7][n]
    return [2, 4, 8][n]
end
