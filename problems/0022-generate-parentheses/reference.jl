# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function _generate!(p::String, left::Int, right::Int, res::Vector{String})
    if right == 0
        push!(res, p)
    else
        if left > 0
            _generate!(string(p, "("), left - 1, right, res)
        end

        if right > left
            _generate!(string(p, ")"), left, right - 1, res)
        end
    end
end

function generate_parenthesis(n::Int)::Vector{String}
    res = String[]
    _generate!("", n, n, res)
    return res
end
