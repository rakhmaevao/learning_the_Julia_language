# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function letter_case_permutation(s::String)
    ans = [""]
    for i in s
        if isletter(i)
            tmp = ans[:]
            ans .*= lowercase(i)
            tmp .*= uppercase(i)
            append!(ans, tmp)
        else
            ans .*= i
        end
    end
    ans
end
