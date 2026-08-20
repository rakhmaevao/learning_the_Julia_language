# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_sub(s::String)
    ss = split(s, '0')
    return sum(binomial(length(subs) + 1, 2) for subs in ss)
end
