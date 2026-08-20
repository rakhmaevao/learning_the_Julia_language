# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function check_subarray_sum(nums::Vector{Int}, k::Int)
    pushfirst!(nums, 0)
    cumsum!(nums, nums)
    nums .%= k
    st = Set{Int}()
    len = length(nums)
    for i in 3:len
        nums[i] ∈ st && return true
        push!(st, nums[i - 1])
    end
    return false
end
