# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function swap_pairs(head::ListNode)::ListNode
    pre = dummpy = ListNode()
    pre.next = head

    while !isnothing(next(pre)) && !isnothing(next(next(pre)))
        a = pre.next
        b = a.next

        ## `pre->a->b->b.next` => `pre->b->a->b.next`
        pre.next, b.next, a.next = b, a, b.next

        pre = a
    end

    return dummpy.next
end
