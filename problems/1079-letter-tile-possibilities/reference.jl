# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function letter_tile_possibilities(tiles::String)
    cnt = zeros(Int, 26)
    for c in tiles
        cnt[c - 'A' + 1] += 1
    end
    function dfs(cnt::Vector{Int})
        res = 0
        for i in 1:26
            cnt[i] == 0 && continue
            res += 1
            cnt[i] -= 1
            res += dfs(cnt)
            cnt[i] += 1
        end
        res
    end
    dfs(cnt)
end
