# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function broken_calc(x::Integer, y::Integer)
    cnt = 0
    while x < y
        isodd(y) ? (y += 1) : y >>= 1
        cnt += 1
    end
    return cnt + x - y
end
