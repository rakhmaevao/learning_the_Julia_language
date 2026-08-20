# Шаблон решения задачи 232. Implement Queue using Stacks
# Запуск тестов:  ./leet test 232

using LeetKit.Support

using DataStructures

struct MyQueue
    in_stack::Vector{Int}
    out_stack::Vector{Int}
    MyQueue() = begin
            new(Int[], Int[])
        end
end

function myqueue_push!(queue::MyQueue, x::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: myqueue_push!")
end

function myqueue_pop!(queue::MyQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: myqueue_pop!")
end

function myqueue_peek(queue::MyQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: myqueue_peek")
end

function myqueue_isempty(queue::MyQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: myqueue_isempty")
end

function myqueue_move!(queue::MyQueue)
    # TODO: напишите своё решение
    error("Задача ещё не решена: myqueue_move!")
end
