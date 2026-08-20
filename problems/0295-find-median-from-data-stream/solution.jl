# Шаблон решения задачи 295. Find Median from Data Stream
# Запуск тестов:  ./leet test 295

using LeetKit.Support

using DataStructures

Base.@kwdef struct MedianFinder
        maxheap::BinaryMaxHeap{Int} = BinaryMaxHeap{Int}()
        minheap::BinaryMinHeap{Int} = BinaryMinHeap{Int}()
    end

function add_num!(heap::MedianFinder, num::Int)
    # TODO: напишите своё решение
    error("Задача ещё не решена: add_num!")
end

function find_median(heap::MedianFinder)::Float64
    # TODO: напишите своё решение
    error("Задача ещё не решена: find_median")
end
