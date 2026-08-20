# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function climbing_stairs(n::Int)::Int
    n == 1 && return 1
    a, b = 1, 2
    for _ in 3:n
        a, b = b, a + b
    end
    return b
end
