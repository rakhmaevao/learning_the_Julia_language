# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function remove_outer_parentheses(s::String)
    res = ""
    cnt = 0
    for ch in s
        flg = cnt < 0
        cnt += ch == '(' ? -1 : 1
        (flg && cnt < 0) && (res *= ch)
    end
    return res
end
