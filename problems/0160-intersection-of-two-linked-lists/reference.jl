# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function get_intersection_node(head_a::ListNode, head_b::ListNode)::Union{ListNode,Nothing}
    isnothing(head_a) || isnothing(head_b) && return nothing
    pa, pb = head_a, head_b

    while pa != pb
        pa = isnothing(pa) ? head_b : pa.next
        pb = isnothing(pb) ? head_a : pb.next
    end

    return pa
end
