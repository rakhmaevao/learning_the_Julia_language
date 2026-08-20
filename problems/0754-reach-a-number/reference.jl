# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function reach_number(target::Integer)
    target = abs(target)
    k = 0
    while target > 0
        k += 1
        target = target - k
    end
    return iseven(target) ? k : k + 1 + k % 2
end
