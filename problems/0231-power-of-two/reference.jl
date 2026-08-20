# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_power_of_two(n::Int)
    return n > 0 && (n & (n - 1)) == 0
end
