# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function sorted_list_to_bst(head::Union{ListNode, Nothing})::Union{TreeNode, Nothing}
    isnothing(head) && return
    isnothing(head.next) && return TreeNode(head.val)

    slow, fast = head, head.next.next
    while !isnothing(fast) && !isnothing(fast.next)
        fast = fast.next.next
        slow = slow.next
    end

    tmp = slow.next
    slow.next = nothing

    root = TreeNode(tmp.val)
    root.left = sorted_list_to_bst(head)
    root.right = sorted_list_to_bst(tmp.next)

    return root
end
