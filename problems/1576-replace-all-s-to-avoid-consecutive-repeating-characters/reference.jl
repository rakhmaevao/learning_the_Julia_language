# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function modify_string(s::String)
    char_vec = collect(s)
    for i in 1:length(char_vec)
        if char_vec[i] == '?'
            char_vec[i] = 'a'
            (i > 1 && char_vec[i - 1] == 'a') && (char_vec[i] += 1)
            (i < length(char_vec) && char_vec[i + 1] == char_vec[i]) && (char_vec[i] += 1)
            (i > 1 && char_vec[i - 1] == char_vec[i]) && (char_vec[i] += 1)
        end
    end
    return join(char_vec)
end
