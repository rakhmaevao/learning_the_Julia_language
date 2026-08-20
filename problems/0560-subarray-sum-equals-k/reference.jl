# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function subarray_sum(nums::Vector{Int}, k::Int)
    mp = DefaultDict(0, 0 => 1)
    res, pre_sum = 0, 0
    for num in nums
        pre_sum += num
        res += mp[pre_sum - k]
        mp[pre_sum] += 1
    end
    res
end
