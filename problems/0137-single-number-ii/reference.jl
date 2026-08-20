# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function single_number(nums::Vector{Int})::Int
    a, b = 0, 0
    for num in nums
        b = (b ⊻ num) & ~a
        a = (a ⊻ num) & ~b
    end
    return b
end
