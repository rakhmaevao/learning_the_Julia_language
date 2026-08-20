# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function num_jewels_in_stones(jewels::String, stones::String)
    mp = fill(0, 128)
    for i in codeunits(jewels)
        mp[i] = 1
    end
    sum(mp[i] for i in codeunits(stones))
end
