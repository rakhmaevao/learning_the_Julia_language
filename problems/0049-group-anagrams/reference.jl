# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

using DataStructures

function group_anagrams(strs::Vector{String})::Vector{Vector{String}}
    swords = DefaultDict{AbstractString,Vector{String}}(Vector{Int})
    for word in strs
        key = join(sort(collect(word)))
        push!(swords[key], word)
    end
    res = Vector{Vector{String}}()
    for (k, v) in swords
        push!(res, v)
    end
    return res
end
