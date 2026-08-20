# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function magical_string(n::Int)
    res = "122"
    idx = 2
    while length(res) < n
        res *= '1'^(res[idx+=1] - '0')
        res *= '2'^(res[idx += 1] - '0')
    end
    return count(==('1'), SubString(res, 1, n))
end
