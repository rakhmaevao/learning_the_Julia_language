# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_kpairs(nums::Vector{Int}, k::Int)
    cntr = counter(nums)
    res = 0
    if k > 0
        for (ky, vl) in cntr
            res += (ky - k in keys(cntr)) ? 1 : 0
        end
    else
        for (ky, vl) in cntr
            res += ifelse(vl > 1, 1, 0)
        end
    end
    return res
end
