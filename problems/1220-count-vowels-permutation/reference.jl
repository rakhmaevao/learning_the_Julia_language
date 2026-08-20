# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function count_vowel_permutation(n::Int)::Int
    table = Dict{Char,Int}(i => 1 for i in "aeiou")
    quotient = 10^9 + 7
    for _ in 1:(n - 1)
        a = table['e'] + table['i'] + table['u']
        e = table['a'] + table['i']
        i = table['e'] + table['o']
        o = table['i']
        u = table['i'] + table['o']
        table['a'], table['e'], table['i'], table['o'], table['u'] = map(
            x -> mod(x, quotient), [a, e, i, o, u]
        )
    end
    return mod(sum(values(table)), quotient)
end
