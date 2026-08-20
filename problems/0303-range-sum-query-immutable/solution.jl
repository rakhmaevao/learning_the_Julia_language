# Шаблон решения задачи 303. Range Sum Query - Immutable
# Запуск тестов:  ./leet test 303

using LeetKit.Support

struct NumArray
    sums::Vector
    function NumArray(nums::Vector)
        n = length(nums)
        sums = nums[:]
        for i = 2:n
            sums[i] = sums[i - 1] + nums[i]
        end
        new(sums)
    end
end

function sum_range(nums::NumArray, i::Int, j::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: sum_range")
end
