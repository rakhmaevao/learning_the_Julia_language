# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_product(nums::Vector{Int})
    maxF = minF = res = nums[1]
    for num in @view nums[2:end]
        maxF, minF = max(maxF * num, minF * num, num), min(minF * num, maxF * num, num)
        res = max(res, maxF)
    end
    res
end
