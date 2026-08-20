# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function min_height_shelves(books::Vector{Vector{Int}}, shelf_width::Int)
    n = length(books)
    dp = OffsetArray(fill(typemax(Int) >> 1, n + 1), -1)
    dp[0] = 0
    for i in 1:n
        idx, width, height = i - 1, books[i][1], books[i][2]
        while width <= shelf_width
            dp[i] = min(dp[i], dp[idx] + height)
            idx == 0 && break
            height = max(height, books[idx][2])
            width += books[idx][1]
            idx -= 1
        end
    end
    dp[end]
end
