# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function monotone_increasing_digits(N::Int)::Int
    some_ones = 111111111
    res = 0
    for _ in 1:9
        while res + some_ones > N
            some_ones ÷= 10
        end
        res += some_ones
    end
    return res
end
