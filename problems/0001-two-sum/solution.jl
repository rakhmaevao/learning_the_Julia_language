# Шаблон решения задачи 1. Two Sum
# Запуск тестов:  ./leet test 1

using LeetKit.Support

function two_sum(nums::Vector{Int}, target::Int)::Union{Nothing, Tuple{Int, Int}}
    for i_left in range(1, length(nums))
        for i_right in range(1, length(nums))
            if i_left == i_right
                continue
            end
            if nums[i_left] + nums[i_right] == target
                return (i_left, i_right)
            end
        end
    end
end
