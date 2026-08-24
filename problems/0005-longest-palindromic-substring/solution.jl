# Шаблон решения задачи 5. Longest Palindromic Substring
# Запуск тестов:  ./leet test 5

using LeetKit.Support

function longest_palindrome(s::String)::AbstractString
    if isempty(s)
        return ""
    end
    max_palindrome_substring = ""
    for i in eachindex(s)
        current_substring = "$(s[i])"
        for j in i + 1:length(s)
            current_substring = current_substring * s[j]
            if _is_palindromic(current_substring)
                if length(current_substring) > length(max_palindrome_substring)
                    max_palindrome_substring = current_substring
                end
            end
        end
    end
    return max_palindrome_substring

end

function _is_palindromic(s:: String)::Bool
    for i in 1:length(s) ÷ 2
        if s[i] != s[end-i+1]
            return false
        end
    end
    return true
end
