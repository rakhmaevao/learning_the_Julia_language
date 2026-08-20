# Шаблон решения задачи 307. Range Sum Query - Mutable
# Запуск тестов:  ./leet test 307

using LeetKit.Support

mutable struct SegmentTree{T <: Real}
    n::Int
    tree::Vector{T}
    function SegmentTree(nums::Vector{T}) where T
        n = length(nums)
        tree = append!(zeros(Int, n - 1), nums)
        for i = n - 1:-1:1
            tree[i] = tree[i << 1] + tree[i << 1 | 1]
        end
        return new{T}(n, tree)
    end
end

function update!(ST::SegmentTree, ind::Int, val::Int)::Nothing
    # TODO: напишите своё решение
    error("Задача ещё не решена: update!")
end

function sum_range(ST::SegmentTree, left::Int, right::Int)::Int
    # TODO: напишите своё решение
    error("Задача ещё не решена: sum_range")
end
