# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

simplified_fractions(n::Int) = ["$p/$q" for q in 2:n for p in 1:(q - 1) if gcd(p, q) == 1]
