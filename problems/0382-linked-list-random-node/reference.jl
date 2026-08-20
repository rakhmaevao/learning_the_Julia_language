# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function get_random(head::ListNode)::Int
    node, i, res = head, 1, 0
    while !isnothing(node)
        if rand(1:i) == 1  ## 1/i prob for value change
            res = node.val
        end
        node = node.next
        i += 1
    end
    return res
end
