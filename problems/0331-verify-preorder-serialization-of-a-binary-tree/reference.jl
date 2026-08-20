# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_valid_serialization(preorder::String)::Bool
    p = split(preorder, ",")
    slot = 1

    for node in p
        slot == 0 && return false

        slot = (node == "#") ? (slot - 1) : (slot + 1)
    end

    return slot == 0
end
