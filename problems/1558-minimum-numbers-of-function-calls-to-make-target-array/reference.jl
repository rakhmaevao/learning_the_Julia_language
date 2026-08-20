# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_operations1558(nums::Vector{Int})
    m = maximum(nums)
    res = 0
    for num in nums
        while num > 0
            num &= (num - 1)
            res += 1
        end
    end
    while m > 1
        m >>= 1
        res += 1
    end
    res
end
