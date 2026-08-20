# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_unsorted_subarray(nums::Vector{Int})
    stk = Int[]
    l, r = length(nums) + 1, 1
    for i in eachindex(nums)
        while !isempty(stk) && nums[stk[end]] > nums[i]
            l = min(l, pop!(stk))
        end
        push!(stk, i)
    end
    empty!(stk)
    for i in length(nums):-1:1
        while !isempty(stk) && nums[stk[end]] < nums[i]
            r = max(r, pop!(stk))
        end
        push!(stk, i)
    end
    return r - l > 0 ? r - l + 1 : 0
end
