# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function max_points(points::Vector{Vector{Int}})
    res = 0
    for i in 1:length(points)
        if res > length(points) - i
            return res
        end
        cnt = DefaultDict{Rational, Int}(1)
        for j in i+1:length(points)
            cnt[(points[i][2] - points[j][2]) // (points[i][1] - points[j][1])] += 1
        end
        res = max(res, maximum(p.second for p in cnt))
    end
    res
end
