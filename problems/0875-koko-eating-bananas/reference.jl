# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_eating_speed(piles::Vector{Int}, h::Int)::Int
    function possible(mid)
        t = 0
        for pile in piles
            t += cld(pile, mid)
        end
        return t <= h
    end

    left, right = 1, maximum(piles)
    while left <= right
        mid = (left + right) >> 1
        if possible(mid)
            right = mid - 1
        else
            left = mid + 1
        end
    end

    return left
end
