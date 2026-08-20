# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function kth_grammar(N::Int, K::Int)
    res = false
    for i in 1:N
        iseven(K) && (res = !res)
        K = (K + 1) >> 1
    end
    res
end
