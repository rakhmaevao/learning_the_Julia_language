# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_error_nums(nums::Vector{Int})
    cnt = fill(0x0, length(nums))
    for num in nums
        cnt[num] += 1
    end
    return findfirst(==(0x2), cnt), findfirst(==(0x0), cnt)
end
