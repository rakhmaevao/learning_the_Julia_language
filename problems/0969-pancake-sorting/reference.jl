# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function pancake_sort(arr::Vector{Int})
    len = length(arr)
    res = Int[]
    for i in len:-1:1
        v = @view(arr[1:i])
        agm = argmax(v)
        if i != agm
            append!(res, (agm, i))
            pancake_sort!(arr, (agm, i))
        end
    end
    return res
end
function pancake_sort!(arr::Vector{Int}, ops)
    for op in ops
        reverse!(@view(arr[1:op]))
    end
    return arr
end
