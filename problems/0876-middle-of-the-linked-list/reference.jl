# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

## double pointers
function middle_node_by_double_pointers(head::ListNode)::ListNode
    p1 = p2 = head
    while !isnothing(p2)
        p2 = next(p2)
        isnothing(p2) && return p1
        p2, p1 = p2.next, p1.next
    end
    return p1
end
