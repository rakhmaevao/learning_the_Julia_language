# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function complex_number_multiply(num1::String, num2::String)
    Ct = Complex{Int}
    mult = parse(Ct, num1) * parse(Ct, num2)
    return "$(mult.re)+$(mult.im)i"
end
