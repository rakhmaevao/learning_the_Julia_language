# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function poor_pigs(buckets::Int, minutesToDie::Int, minutesToTest::Int)
    state = minutesToTest ÷ minutesToDie + 1
    return ceil(Int, log(buckets) / log(state))
end
