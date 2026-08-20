# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function sum_odd_length_subarrays(arr::Vector{Int})::Int
    res = 0
    len = length(arr)
    for i in 1:len
        l, r = i - 1, len - i
        lodd, rodd = (l + 1) ÷ 2, (r + 1) ÷ 2
        leven, reven = l ÷ 2 + 1, r ÷ 2 + 1
        res += arr[i] * (lodd * rodd + leven * reven)
    end
    res
end
