# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function prefixes_div_by5(nums::Vector{Int})
    len = length(nums)
    res = fill(false, len)
    cur = 0
    for i in 1:len
        cur = cur * 2 + nums[i]
        cur % 5 == 0 && (res[i] = true)
    end
    return res
end
