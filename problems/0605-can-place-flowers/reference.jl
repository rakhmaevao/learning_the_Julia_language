# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_startvalue(nums::Vector{Int})
    total = mintotal = 0
    for num in nums
        total += num
        mintotal = min(mintotal, total)
    end
    return 1 - min(0, mintotal)
end
