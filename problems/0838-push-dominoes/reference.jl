# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function push_dominoes(dominoes::String)::String
    ans = ""
    rules = ("R.L" => "T", ".L" => "LL", "R." => "RR", "T" => "R.L")
    while dominoes != ans
        ans = dominoes
        dominoes = foldl(replace, [dominoes, rules...])
    end
    return ans
end
