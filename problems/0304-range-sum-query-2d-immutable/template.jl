# Шаблон решения задачи 304. Range Sum Query 2D - Immutable
# Запуск тестов:  ./leet test 304

using LeetKit.Support

struct NumMatrix
    sums::Vector{Vector{Int}}
    function NumMatrix(matrix::Vector{Vector{Int}})
        (m, n) = (length(matrix), length(matrix[1]))
        sums = [fill(0, n + 1) for _ = 1:m]
        for i = 1:m, j = 1:n
            (sums[i])[j + 1] = (sums[i])[j] + (matrix[i])[j]
        end
        new(sums)
    end
end

function sum_region(matrix::NumMatrix, row1::Int, col1::Int, row2::Int, col2::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: sum_region")
end
