# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function beautiful_arrangement(n, k)
    res = [1:(n-k);]
    i = res[end] + 1
    j = n
    while i < j
        push!(res, j)
        j -= 1
        push!(res, i)
        i += 1
    end
    i == j && push!(res, i)
    return res
end
