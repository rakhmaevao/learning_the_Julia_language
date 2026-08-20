# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function smallest_good_base(n::Int)
    for m in 62:-1:2
        k = floor(Int, n^(1 / m))
        k ≤ 1 && continue
        s = (Int128(k)^(m + 1) - 1) ÷ (k - 1)
        (s == n) && return k
    end
    n - 1
end
