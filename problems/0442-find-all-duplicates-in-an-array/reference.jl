# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_duplicates_442(nums::Vector{Int})
    res = Int[]
    for num in nums
        absn = abs(num)
        nums[absn] < 0 ? push!(res, absn) : (nums[absn] = -nums[absn])
    end
    return res
end
