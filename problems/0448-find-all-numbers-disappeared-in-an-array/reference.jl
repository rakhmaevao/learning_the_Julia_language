# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_all_numbers_disappeared_in_an_array(arr::Vector{Int})
    return setdiff(eachindex(arr), arr)
end

## add your code here:
