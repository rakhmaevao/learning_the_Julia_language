# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function license_key_formatting(S::String, K::Int)
    res = ""
    cnt = 0
    for i in length(S):-1:1
        if cnt == K
            res *= '-'
            cnt = 0
        end
        if S[i] != '-'
            res *= uppercase(S[i])
            cnt += 1
        end
    end
    reverse(res)
end
