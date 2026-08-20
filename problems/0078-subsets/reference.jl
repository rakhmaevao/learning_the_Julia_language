# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function subsets(arr::Vector{T}) where T
    res = [T[]]
    for e in arr
        for i in eachindex(res)
            push!(res, vcat(res[i], e))
        end
    end
    res
end

## add your code here:
