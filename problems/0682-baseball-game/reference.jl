# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function calculate_points(ops::Vector{String})::Int
    scores = Int[]
    for op in ops
        if op == "+"
            push!(scores, last(scores) + scores[end - 1])
        elseif op == "D"
            push!(scores, last(scores) * 2)
        elseif op == "C"
            pop!(scores)
        else
            push!(scores, parse(Int, op))
        end
    end
    return sum(scores)
end
