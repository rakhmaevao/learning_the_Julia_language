# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function combination_sum_39(
    nums::Union{Vector{Int},SubArray}, target::Int
)::Vector{Vector{Int}}
    target == 0 && return [Int[]]
    isempty(nums) && return Vector{Int}[]
    res, num = Vector{Int}[], nums[end]
    for i in 0:(target ÷ num)
        for vec in combination_sum_39(@view(nums[1:(end - 1)]), target - i * num)
            append!(res, [append!(vec, fill(num, i))])
        end
    end
    return res
end
