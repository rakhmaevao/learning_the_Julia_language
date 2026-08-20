# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_score_sightseeing_pair(A::Vector{Int})
    res, mx = 0, A[1] + 0
    for j in 2:length(A)
        res = max(res, A[j] - j + 1 + mx)
        mx = max(mx, A[j] + j - 1)
    end
    res
end
