# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function duplicate_zeros!(arr::Vector{Int})
    len = length(arr)
    for i in reverse(eachindex(arr))
        iszero(arr[i]) && insert!(arr, i, 0)
    end
    resize!(arr, len)
    nothing
end

## add your code here:
