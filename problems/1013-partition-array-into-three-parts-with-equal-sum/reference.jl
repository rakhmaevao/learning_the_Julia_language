# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function can_three_parts_equal_sum(arr::Vector{Int})
    function can_three_parts_equal_sum(arr::AbstractVector{Int}, n::Int)
        targ = sum(arr)
        if targ % n != 0 || length(arr) == 0
            return false
        elseif n == 1
            return true
        end
        targ ÷= n
        acc = 0
        for i in 1:length(arr)
            acc += arr[i]
            targ == acc && return can_three_parts_equal_sum(@view(arr[(i + 1):end]), n - 1)
        end
        return false
    end
    return can_three_parts_equal_sum(arr, 3)
end
