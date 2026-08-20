# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_pairs_divisible_by60(time::Vector{Int})
    res = 0
    dct = fill(0, 60)
    for t in time
        (t % 60 == 0) ? (dct[60] += 1) : (dct[t % 60] += 1)
    end
    for i in 1:29
        res += dct[i] * dct[60 - i]
    end
    res += sum(1:(dct[30] - 1)) + sum(1:(dct[60] - 1))
    return res
end
