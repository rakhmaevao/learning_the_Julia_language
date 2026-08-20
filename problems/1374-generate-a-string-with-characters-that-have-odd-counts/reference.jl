# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

generate_the_string(n::Int) = isodd(n) ? 'a'^n : 'a' * 'b'^(n - 1)
