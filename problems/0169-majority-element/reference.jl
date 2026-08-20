# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function majority_element(nums::Vector{Int})::Int
    res = vote = 0
    for num in nums
        if vote == 0
            vote += 1
            res = num
        else
            vote += (res == num) ? 1 : -1
        end
    end
    return res
end
