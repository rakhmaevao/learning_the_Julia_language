# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function reverse_between(head::ListNode{Int}, m::Int, n::Int)::ListNode
    (isnothing(head) || m == n) && return head
    p = dummy = ListNode()
    next!(dummy, head)
    for _ = 1:m-1
        p = next(p)
    end

    tail = next(p)

    for _ = 1:n-m
        tmp = next(p)
        next!(p, next(tail))
        next!(tail, next(next(tail)))
        next!(next(p), tmp)
    end

    return next(dummy)
end
