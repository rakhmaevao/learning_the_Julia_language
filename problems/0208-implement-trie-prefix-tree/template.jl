# Шаблон решения задачи 208. Implement Trie (Prefix Tree)
# Запуск тестов:  ./leet test 208

using LeetKit.Support

Base.@kwdef mutable struct PrefixNode
        isend::Bool = false
        children = Dict{Char, PrefixNode}()
    end

function insert_node!(node::PrefixNode, word::String)::Nothing
    # TODO: напишите своё решение
    error("Задача ещё не решена: insert_node!")
end

function search_prefix_node(node::PrefixNode, prefix::String)::Union{Nothing, PrefixNode}
    # TODO: напишите своё решение
    error("Задача ещё не решена: search_prefix_node")
end

function search_word(node::PrefixNode, word::String)::Bool
    # TODO: напишите своё решение
    error("Задача ещё не решена: search_word")
end

function starts_with(node::PrefixNode, prefix::String)
    # TODO: напишите своё решение
    error("Задача ещё не решена: starts_with")
end
