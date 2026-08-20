# Шаблон решения задачи 622. Design Circular Queue
# Запуск тестов:  ./leet test 622

using LeetKit.Support

mutable struct MyCircularQueue
    len::Int
    front::Int
    rear::Int
    arr::Vector{Int}
    MyCircularQueue(k::Int) = begin
            new(k + 1, 1, 1, Vector{Int}(undef, k + 1))
        end
end

function is_full(que::MyCircularQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: is_full")
end

function en_queue(que::MyCircularQueue, val::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: en_queue")
end

function is_empty(que::MyCircularQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: is_empty")
end

function de_queue(que::MyCircularQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: de_queue")
end

function front(que::MyCircularQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: front")
end

function rear(que::MyCircularQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: rear")
end
