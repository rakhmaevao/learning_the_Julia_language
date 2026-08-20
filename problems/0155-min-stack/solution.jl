# Шаблон решения задачи 155. Min Stack
# Запуск тестов:  ./leet test 155

using LeetKit.Support

Base.@kwdef struct MinStack{V <: Number}
        nums::Vector{V} = Int[]
        min_nums::Vector{V} = Int[]
    end

function Base.push!(stack::MinStack, val::Int)::Nothing
    # TODO: напишите своё решение
    error("Задача ещё не решена: Base.push!")
end

function Base.pop!(stack::MinStack)::Nothing
    # TODO: напишите своё решение
    error("Задача ещё не решена: Base.pop!")
end

function top(stack::MinStack)::Int
    # TODO: напишите своё решение
    error("Задача ещё не решена: top")
end

function get_min(stack::MinStack)::Int
    # TODO: напишите своё решение
    error("Задача ещё не решена: get_min")
end
