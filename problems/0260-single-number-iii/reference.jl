# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function single_number_iii(nums::Vector{T}) where T <: Integer
    res = reduce(⊻, nums; init = zero(T))
    div = one(T)
    while (div & res) == 0
        div <<= one(T)
    end
    a = b = 0
    for n in nums
        (div & n == 0) ? a ⊻= n : b ⊻= n
    end
    return a, b
end
