# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_closest_elements(arr::Vector{Int}, k::Int, x::Int)
    res = Int[]
    j = searchsortedfirst(arr, x)
    i = j - 1
    for _ in 1:k
        if i == 0 || (j <= length(arr) && arr[j] - x < x - arr[i])
            push!(res, arr[j])
            j += 1
        else
            pushfirst!(res, arr[i])
            i -= 1
        end
    end
    return res
end
