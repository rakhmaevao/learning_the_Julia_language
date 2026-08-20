# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function distinct_subseq2(s::String)
    arr = zeros(Int, 26)
    for c in codeunits(s)
        arr[c - UInt8('a' - 1)] = (sum(arr) + 1) % 1_000_000_007
    end
    return sum(arr) % 1_000_000_007
end
