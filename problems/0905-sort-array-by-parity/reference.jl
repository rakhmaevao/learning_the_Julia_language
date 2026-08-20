# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function sort_array_by_parity!(arr::Vector{Int})
    i, j = 1, length(arr)
    while i < j
        if iseven(arr[i])
            i += 1
        else
            arr[i], arr[j] = arr[j], arr[i]
            j -= 1
        end
    end
    return arr
end
