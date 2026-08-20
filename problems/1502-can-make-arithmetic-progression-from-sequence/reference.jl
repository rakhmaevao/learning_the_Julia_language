# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

can_make_arith(arr::Vector{Int})::Bool = length(unique!(diff(sort(arr)))) == 1
