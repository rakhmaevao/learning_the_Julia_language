# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_profit(inventory::Vector{Int}, orders::Int)
    rest = sum(inventory) - orders
    sort!(inventory)
    len = length(inventory)
    for n in inventory
        if rest ÷ len >= n
            len -= 1
            rest -= n
        else
            break
        end
    end
    q = rest ÷ len
    r = rest - q * len
    ret = 0
    for i in (length(inventory) - len + 1):length(inventory)
        ret += sum((q + 2):inventory[i])
    end
    ret += (q + 1) * (len - r)
    return ret % (10^9 + 7)
end
