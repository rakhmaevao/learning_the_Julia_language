# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function next_greater_elements(nums::Vector{Int})
    stk = Int[]
    res = fill(-1, size(nums))
    for rd in 1:2, (idx, num) in enumerate(nums)
        while !isempty(stk) && nums[stk[end]] < num
            res[pop!(stk)] = num
        end
        (rd == 1) && push!(stk, idx)
    end
    return res
end
