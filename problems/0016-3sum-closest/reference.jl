# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

three_sum_closest(nums::Vector{Int}, target::Int) = three_sum_closest!(copy(nums), target)
function three_sum_closest!(nums::Vector{Int}, target::Int)::Int
    mindiff, n, res = Inf, length(sort!(nums)), 0
    for (i, first) in enumerate(nums)
        i > 1 && nums[i - 1] == first && continue
        left, right, newtarget = i + 1, n, target - first
        while left < right
            newsum = nums[left] + nums[right]
            newdiff = abs(newsum - newtarget)
            if newdiff < mindiff ## updates minimal difference
                newdiff == 0 && return target
                mindiff, res = newdiff, newsum + first
            elseif newsum > newtarget
                right -= 1
            else
                left += 1
            end
        end
    end
    return res
end
