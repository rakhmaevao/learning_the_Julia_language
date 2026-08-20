# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function has_cycle(head::Union{ListNode,Nothing})::Bool
    isnothing(head) && return false
    swift = slow = head
    while !isnothing(swift.next) && !isnothing(swift.next.next)
        slow, swift = slow.next, swift.next.next
        slow === swift && return true
    end
    return false
end
