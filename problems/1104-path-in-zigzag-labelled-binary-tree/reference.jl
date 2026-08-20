# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function path_in_zig_zag_tree(n::Int)
    res = Int[]
    layer = floor(Int, log2(n)) + 1
    while layer != 0
        push!(res, n)
        b = (1 << layer) + (1 << (layer - 1)) - 1
        iseven(layer) && (n = b - n)
        n >>= 1
        layer -= 1
        iseven(layer) && (n = (b >> 1) - n)
    end
    reverse!(res)
    return res
end
