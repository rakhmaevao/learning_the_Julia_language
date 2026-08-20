# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function rotate_arr(nums::Vector{Int}, k::Int)
    k %= length(nums)
    reverse!(nums)
    reverse!(@view nums[1:k])
    reverse!(@view nums[k+1:end])
    nums
end
