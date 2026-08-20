# Шаблон решения задачи 1656. Design an Ordered Stream
# Запуск тестов:  ./leet test 1656

using LeetKit.Support

mutable struct OrderStream
    data::(AbstractVector{T} where T <: AbstractString)
    n::Int
    ptr::Int
    OrderStream(n::Int) = begin
            new(fill("", n), n, 1)
        end
end

function insertdata!(stream::OrderStream, idkey::Int, val::String)
    # TODO: напишите своё решение
    error("Задача ещё не решена: insertdata!")
end
