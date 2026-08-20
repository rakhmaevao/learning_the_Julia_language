# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

using OffsetArrays
function h_index(citations::Vector{Int})::Int
    len = length(citations)
    cnt = OffsetArray(fill(0, len + 1), -1)
    for c in citations
        cnt[min(c, len)] += 1
    end
    c = 0
    for i in Iterators.reverse(eachindex(cnt))
        c += cnt[i]
        c == i && return i
    end
end
