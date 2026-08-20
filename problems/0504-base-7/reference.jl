# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function convert_to_base7(num::Int)::String
    num == 0 && return "0"
    sign = num < 0 ? -1 : 1
    num *= sign
    res = Int[]
    while num > 0
        push!(res, num % 7)
        num ÷= 7
    end
    reverse!(res)
    return sign != -1 ? join(res) : "-" * join(res)
end
