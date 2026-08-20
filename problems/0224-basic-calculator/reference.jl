# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function calculate(s::String)::Int
    res, num, sign, stk = 0, 0, 1, []
    for c in s
        if isdigit(c)
            num = 10 * num + parse(Int, c)
        elseif c in ['-', '+']
            res += num * sign
            num = 0
            sign = (c == '-') ? -1 : 1
        elseif c == '('
            push!(stk, res)
            push!(stk, sign)
            res, sign = 0, 1
        elseif c == ')'
            res += num * sign
            res *= pop!(stk)
            res += pop!(stk)
            num = 0
        end
    end

    return res + num * sign
end
