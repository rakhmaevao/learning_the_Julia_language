# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function validate_stack_sequences(pushed::Vector{Int}, popped::Vector{Int})
    return validate_stack_sequences!(copy(pushed), popped)
end
function validate_stack_sequences!(pushed::Vector{Int}, popped::Vector{Int})::Bool
    stack = Int[]
    for num in popped
        while isempty(stack) || last(stack) != num
            isempty(pushed) && return false
            push!(stack, popfirst!(pushed))
        end
        pop!(stack)
    end
    return true
end
