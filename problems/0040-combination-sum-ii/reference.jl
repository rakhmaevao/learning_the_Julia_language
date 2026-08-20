# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function combinationSum(candidates::AbstractVector{Int}, target::Int)
    res = Vector{Vector{Int}}()
    return combinationSum!(sort(candidates), target, Int[], res)
end

function combinationSum!(
    candidates::AbstractVector{Int},
    target::Int,
    path::AbstractVector{Int},
    res::Vector{Vector{Int}},
)
    # if the target is 0, we find a solution
    target == 0 && return push!(res, copy(path))
    length(candidates) == 0 || target < first(candidates) && return res

    # use @view to avoid copying the array
    for (i, candidate) in enumerate(candidates)
        i > 1 && candidate == candidates[i - 1] && continue
        candidate > target && break
        subcandidates = @view(candidates[1:length(candidate) .!= i]) # skip the current candidate
        combinationSum!(subcandidates, target - candidate, push!(path, candidate), res)
    end
    return res
end
