# Шаблон решения задачи 146. LRU Cache
# Запуск тестов:  ./leet test 146

using LeetKit.Support

struct LRUCache
    cap::Int
    data::OrderedDict{Int, Int}
    LRUCache(cap::Int) = begin
            new(cap, OrderedDict{Int, Int}())
        end
end

function Base.getindex(cache::LRUCache, key)
    # TODO: напишите своё решение
    error("Задача ещё не решена: Base.getindex")
end

function Base.setindex!(cache::LRUCache, val, key)
    # TODO: напишите своё решение
    error("Задача ещё не решена: Base.setindex!")
end
