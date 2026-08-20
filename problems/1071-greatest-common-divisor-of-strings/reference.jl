# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function gcd_of_strings(str1::String, str2::String)
    return str1 * str2 == str2 * str1 ? str1[1:gcd(length(str1), length(str2))] : ""
end
