# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function rearrange_barcodes(barcodes::Vector{Int})
    len = length(barcodes)
    res = zeros(Int, len)
    cnt = counter(barcodes)
    hp = heapify!([(v, k) for (k, v) in cnt])
    idx = 1
    while !isempty(hp)
        v, k = heappop!(hp)
        for _ in 1:v
            res[idx] = k
            idx += 2
            idx > len && (idx = 2)
        end
    end
    return res
end
