# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function sum_subseq_widths(A::Vector{Int})
    MOD = Int(1e9 + 7)
    len = length(A)
    sort!(A)
    pow = fill(2, len)
    for i in 2:len
        pow[i] = (pow[i - 1] << 1) % MOD
    end
    res = 0
    for i in 2:(len - 1)
        res += (A[i]) * ((pow[i - 1] - pow[len - i])) % MOD
    end
    return mod1((res + (A[end] - A[1]) * (pow[len - 1] - 1) % MOD), MOD)
end
