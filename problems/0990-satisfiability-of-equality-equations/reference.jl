# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function equations_possible(equations::Vector{String})
    disjs = DisjointSets{Char}('a':'z')
    for eq in equations
        eq[2] == '!' && continue
        union!(disjs, eq[1], eq[4])
    end
    for eq in equations
        eq[2] == '=' && continue
        in_same_set(disjs, eq[1], eq[4]) && return false
    end
    return true
end
