# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function powerful_integers(x::Int, y::Int, bound::Int)
    res = Set{Int}()
    i = 1
    while i < bound
        j = 1
        while i + j ≤ bound
            push!(res, i + j)
            j *= y
            (y == 1) && break
        end
        i *= x
        (x == 1) && break
    end
    res
end
