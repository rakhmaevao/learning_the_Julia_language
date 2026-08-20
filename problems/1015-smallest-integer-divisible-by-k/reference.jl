# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function smallest_repunit_div_by_k(K::Int)
    (K % 2 == 0 || K % 5 == 0) && (return -1)
    r, len = 0, 1
    while true
        r = (10 * r % K + 1) % K
        r == 0 && return len
        len += 1
    end
end
