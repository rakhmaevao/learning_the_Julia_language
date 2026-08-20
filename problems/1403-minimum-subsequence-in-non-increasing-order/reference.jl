# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_subsequence(nums::Vector{Int})
    sort!(nums; rev=true)
    half = sum(nums) >> 1
    res, total = Int[], 0
    for num in nums
        total += num
        push!(res, num)
        total > half && return res
    end
end
