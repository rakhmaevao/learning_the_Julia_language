# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function add_digits(num::Int)::Int
    num <= 9 && return num
    return iszero(num % 9) ? 9 : num % 9
end
