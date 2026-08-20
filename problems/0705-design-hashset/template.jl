# Шаблон решения задачи 705. Design HashSet
# Запуск тестов:  ./leet test 705

using LeetKit.Support

struct MyHashSet
    buckets::Int
    table::(Vector{Vector{T}} where T)
    MyHashSet() = begin
            new(1009, [[] for _ = 1:1009])
        end
end

function hash_705(hash_set::MyHashSet, key::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: hash_705")
end

function add_705!(hash_set::MyHashSet, key)
    # TODO: напишите своё решение
    error("Задача ещё не решена: add_705!")
end

function remove_705!(hash_set::MyHashSet, key::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: remove_705!")
end

function contains_705(hash_set::MyHashSet, key::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: contains_705")
end
