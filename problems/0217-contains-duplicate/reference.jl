# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function contains_duplicate(nums::Vector{Int})::Bool
    hash_table = Int[]
    for i in nums
        !(i in hash_table) ? push!(hash_table, i) : return true
    end
    return false
end
