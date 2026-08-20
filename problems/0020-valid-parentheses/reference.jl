# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_valid_parentheses(s::String)::Bool
    unclose, left_side = Char[], Dict{Char,Char}(')' => '(', ']' => '[', '}' => '{')
    for i in s
        if i in "([{"
            push!(unclose, i)
        else
            (isempty(unclose) || left_side[i] != unclose[end]) && return false
            pop!(unclose)
        end
    end
    return isempty(unclose)
end
