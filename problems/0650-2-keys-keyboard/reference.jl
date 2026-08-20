# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_steps650(n::Int)
    res, k = 0, 2
    while n != 1
        while n % k == 0
            res += k
            n ÷= k
        end
        k += 1
    end
    return res
end
