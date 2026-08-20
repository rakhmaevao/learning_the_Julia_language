# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function subarrays_div_by_k(A::Vector{Int}, K::Int)
    dct = DefaultDict{Int,Int}(0)
    dct[0] = 1
    prex = res = 0
    for num in A
        prex = mod(num + prex, K)
        res += dct[prex]
        dct[prex] += 1
    end
    res
end
