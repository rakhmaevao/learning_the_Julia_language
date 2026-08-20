# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_longest_word(s::String, dictionary::Vector{String})
    function is_subsequence(s::String, t::String)::Bool
        i, j = 1, 1
        lens, lent = length(s), length(t)
        while j <= lent
            if s[i] == t[j]
                i += 1
                i > lens && return true
            end
            j += 1
        end
        return false
    end
    res = ""
    for str in dictionary
        (is_subsequence(str, s) && (length(res) < length(str) || res > str)) && (res = str)
    end
    return res
end
