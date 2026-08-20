# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_chunks_to_sorted_ii(arr::Vector{Int})
    return count(i == num + 1 for (i, num) in enumerate(accumulate(max, arr)))
end
