# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function letter_combinations(digits::String)::Vector{String}
    isempty(digits) && return String[]
    table = Dict{Char,String}(
        '2' => "abc",
        '3' => "def",
        '4' => "ghi",
        '5' => "jkl",
        '6' => "mno",
        '7' => "pqrs",
        '8' => "tuv",
        '9' => "wxyz",
    )
    res = [""]
    for i in digits
        res = [s1 * s2 for s1 in res for s2 in table[i]]
    end
    return res
end
