# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_operations_1198(logs::Vector{String})
    res = 0
    for lg in logs
        if lg == "../"
            res = max(0, res - 1)
        elseif lg != "./"
            res += 1
        end
    end
    return res
end
