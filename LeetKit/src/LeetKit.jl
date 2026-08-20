"""
    LeetKit

Инструментарий для тренировки на задачах LeetCode на языке Julia:
хранение задач в каталоге `problems/`, запуск тестов, учёт прогресса
и веб-интерфейс со статистикой.
"""
module LeetKit

using TOML
using Dates
using Test
using Markdown
using HTTP
using JSON3

include("Support.jl")
include("Meta.jl")
include("Runner.jl")
include("Stats.jl")
include("Server.jl")
include("CLI.jl")

export Problem, load_problems, find_problem, run_tests, run_and_record!,
       mark_solved!, set_status!, set_notes!, reset_solution!, stats, serve

end # module
