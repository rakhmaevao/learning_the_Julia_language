# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_max_length(nums::Vector{Int})
    dc = Dict(0 => 0)
    res = acc = 0
    @inbounds for i in eachindex(nums)
        acc += nums[i] == 0 ? -1 : 1
        haskey(dc, acc) ? res = max(res, i - dc[acc]) : dc[acc] = i
    end
    return res
end
