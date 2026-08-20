# Шаблон решения задачи 901. Online Stock Span
# Запуск тестов:  ./leet test 901

using LeetKit.Support

Base.@kwdef struct StockSpanner
        history::Vector{Pair{Int, Int}} = []
    end

function next!(s::StockSpanner, price::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: next!")
end
