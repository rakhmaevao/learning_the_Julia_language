# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function fair_candy_swap(A::Vector{Int}, B::Vector{Int})
    set_a, set_b = Set(A), Set(B)
    dif = (sum(A) - sum(B)) ÷ 2
    for num_a in set_a
        ((num_a - dif) in set_b) && return [num_a, num_a - dif]
    end
end
