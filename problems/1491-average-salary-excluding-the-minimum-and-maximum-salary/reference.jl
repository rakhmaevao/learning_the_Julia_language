# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function average_salary_excluding_mami(salary::Vector{Int})
    return (sum(salary) - minimum(salary) - maximum(salary)) / (length(salary) - 2)
end
