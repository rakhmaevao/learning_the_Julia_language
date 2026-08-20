# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

remove_element!(nums::Vector{Int}, val::Int) = length(filter!(!=(val), nums))
