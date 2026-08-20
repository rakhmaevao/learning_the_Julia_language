# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function gray_code(N::Int)
    powN = 1 << N
    res = Array{Int}(undef, powN)
    for i in 0:powN-1
        res[i + 1] = i ⊻ (i >> 1);
    end
    res
end
