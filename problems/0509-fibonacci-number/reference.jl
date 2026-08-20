# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function fib(n::Int)::Int
    n <= 1 && return n
    pre, cur = 0, 1
    for _ in 2:n
        pre, cur = cur, pre + cur
    end
    return cur
end
