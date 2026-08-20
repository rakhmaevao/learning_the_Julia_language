# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function delete_duplicates!(head::Union{ListNode,Nothing})::Union{ListNode,Nothing}
    cur = head
    while !isnothing(cur)
        node, value = next(cur), val(cur)
        while !isnothing(node) && val(node) == value
            cur.next = node = next(node)
        end
        cur = next(cur)
    end
    return head
end
