# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function reverse_only_letters(s::String)
    chars = codeunits(s)[:]
    letters = @view(chars[isletter.(Char.(chars))])
    reverse!(letters)
    return String(chars)
end
