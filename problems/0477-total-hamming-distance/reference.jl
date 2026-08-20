# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function total_hamming_distance(nums)
    res, n = 0, length(nums)
    for i in 0:30
        c = 0
        for num in nums
            c += (num >> i) & 1
        end
        res += c * (n - c)
    end
    return res
end
