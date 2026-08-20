# Шаблон решения задачи 706. Design HashMap
# Запуск тестов:  ./leet test 706

using LeetKit.Support

struct MyHashMap
    buckets::Int
    table::(Vector{Vector{T}} where T)
    MyHashMap() = begin
            new(1009, [Tuple{Int, Int}[] for _ = 1:1009])
        end
end

function hash_706(hash_map::MyHashMap, key::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: hash_706")
end

function put_706!(hash_map::MyHashMap, key::Int, value::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: put_706!")
end

function remove_706!(hash_map::MyHashMap, key)
    # TODO: напишите своё решение
    error("Задача ещё не решена: remove_706!")
end

function get_706(hash_map::MyHashMap, key)
    # TODO: напишите своё решение
    error("Задача ещё не решена: get_706")
end
