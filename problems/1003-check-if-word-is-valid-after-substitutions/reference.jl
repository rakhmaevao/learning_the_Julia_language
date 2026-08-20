# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_valid_abc_str(s::String)
    while occursin("abc", s)
        s = replace(s, "abc" => "")
    end
    return s == ""
end
