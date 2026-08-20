# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function unique_number_of_occurrences(arr::Vector{Int})
    counts = Dict{Int, Int}()
    for a in arr
        counts[a] = get(counts, a, 0) + 1
    end
    vs = values(counts)
    return length(vs) == length(unique(vs))
end

## add your code here:
