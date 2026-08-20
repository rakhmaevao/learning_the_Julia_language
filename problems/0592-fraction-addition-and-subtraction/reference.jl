# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function fraction_addition(expression::String)
    expression = replace(expression, "/" => "//")
    res = eval(Meta.parse(expression))
    return "$(res.num)/$(res.den)"
end
