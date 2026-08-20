# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function frequency_sort(nums::Vector{Int})
    freq = counter(nums)
    sort!(nums, by = x -> (freq[x], -x))
end
