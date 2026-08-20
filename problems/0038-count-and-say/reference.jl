# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function countandsay(n::Int)
    # Base case
    n == 1 && return "1"
    # Get the previous term
    previous_term = countandsay(n - 1)
    # Generate the current term by "saying" the previous term
    current_term = ""
    count = 0
    current_char = previous_term[1]

    for char in previous_term
        if char == current_char
            count += 1
        else
            current_term *= string(count) * current_char
            current_char = char
            count = 1
        end
    end
    # Append the last group
    current_term * string(count) * current_char
end
