# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function thousand_separator(n::Int)
    s = string(n)
    r = length(s) % 3
    ed = 0
    if r == 0
        r += 3
        ed += 1
    end
    res = s[1:r]
    for i in 1 : length(s) ÷ 3 - ed
        res *= "." * s[r + i * 3 - 2 : r + i * 3]
    end
    res
end
