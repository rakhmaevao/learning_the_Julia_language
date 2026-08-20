# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function strStr(haystack::String, needle::String)
    needle == "" && return 0
    for i in 1:(length(haystack) - length(needle) + 1)
        if @view(haystack[i:(i + length(needle) - 1)]) == needle
            return i - 1 # Notice that Julia is 1-indexed, and here we need 0-indexed so minus 1
        end
    end
    return -1
end

function strStr2(haystack::AbstractString, needle::AbstractString)
    # border case
    isempty(needle) && return 0
    length(needle) > length(haystack) && return -1
    # match needle
    needle == @view(haystack[1:length(needle)]) && return 0
    # recursive search
    ind = @views strStr2(haystack[2:end], needle)
    return ind == -1 ? -1 : ind + 1
end
