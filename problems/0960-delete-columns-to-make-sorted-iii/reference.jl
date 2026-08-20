# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_deletion_size(A::Vector{String})
    word_len = length(A[1])
    dp = fill(1, word_len)
    for i in word_len - 1 : -1 : 1
        for j in i + 1 : word_len
            all(word[i] < word[j] for word in A) && (dp[i] = max(dp[i], dp[j] + 1))
        end
    end
    word_len - maximum(dp)
end
