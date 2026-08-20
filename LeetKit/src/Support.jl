"""
    LeetKit.Support

Пространство имён, которое подключается в каждое решение задачи.
Содержит общие структуры данных (`ListNode`, `TreeNode`, ...) и реэкспортирует
пакеты, которые часто нужны в решениях (`DataStructures`, `OffsetArrays`, ...).
"""
module Support

using DataStructures
using OffsetArrays
using Dates
using Random
using Printf
import LinearAlgebra

include("support_common.jl")

# Реэкспорт всего публичного из зависимостей, чтобы решение могло просто
# написать `using LeetKit.Support` и получить привычное окружение LeetCode.jl.
const _reexported = Set{Symbol}()
for pkg in (DataStructures, OffsetArrays, Dates, Random, Printf)
    for n in names(pkg)
        (Base.isidentifier(n) && n !== nameof(pkg) && n ∉ _reexported) || continue
        push!(_reexported, n)
        @eval begin
            using $(nameof(pkg)): $n
            export $n
        end
    end
end

for n in names(@__MODULE__; all=true)
    if Base.isidentifier(n) &&
       !startswith(String(n), "_") &&
       n ∉ (nameof(@__MODULE__), :eval, :include, :pkg, :n, :_reexported)
        @eval export $n
    end
end

end # module
