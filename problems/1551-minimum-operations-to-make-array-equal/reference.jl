# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_operations_1551(n::Int)
    return 2 * sum(1 : (n - 1) ÷ 2) + (n & 1 == 0) * (n ÷ 2)
end
