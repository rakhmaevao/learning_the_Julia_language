# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function find_radius(houses::Vector{Int}, heaters::Vector{Int})::Int
    sort!(heaters)
    heaters = [-Inf; heaters; Inf]
    res = 0
    for house in houses
        loc = searchsortedfirst(heaters, house)
        res = max(res, min(house - heaters[loc - 1], heaters[loc] - house))
    end

    return convert(Int, res)
end
