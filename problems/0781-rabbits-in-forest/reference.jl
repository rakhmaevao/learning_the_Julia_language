# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_rabbits(answer::Vector{Int})
    cnt = counter(answer)
    res = 0
    for (key, v) in cnt
        res += ((v - 1) ÷ (key + 1) + 1) * (key + 1)
    end
    res
end
