# Шаблон решения задачи 3. Longest Substring Without Repeating Characters
# Запуск тестов:  ./leet test 3

using LeetKit.Support

function length_of_longest_substring(s::String)::Int
    max_substring_length = 0
    for i in range(1, length(s))
        current_substring = "$(s[i])"
        for j in range(i+1, length(s))
            if occursin(s[j], current_substring)
                break
            end
            current_substring = current_substring * s[j]
        end
        if length(current_substring) > max_substring_length
            max_substring_length = length(current_substring)
        end
    end
    return max_substring_length
end
