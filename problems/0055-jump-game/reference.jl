# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function can_jump(nums::Vector{Int})::Bool
    n, rightmost = length(nums), 1
    for (i, num) in enumerate(nums)
        i > rightmost && return false
        rightmost = max(rightmost, i + num)
        rightmost >= n && return true
    end
    false
end
