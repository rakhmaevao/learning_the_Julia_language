# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

using DataStructures

function last_stone_weight(stones::Vector{Int64})
    # Create a PriorityQueue with unique identifiers for each stone
    heap = PriorityQueue{Tuple{Int64, Int64}, Int64}()
    for (i, stone) in enumerate(stones)
        enqueue!(heap, (stone, i), -stone)  # Use negative stone value for max-heap
    end

    while length(heap) > 1
        # Extract the two largest stones
        largest, _ = dequeue!(heap)
        second_largest, _ = dequeue!(heap)

        # If they are not the same, calculate the difference and enqueue it
        if largest != second_largest
            enqueue!(heap, (largest - second_largest, length(heap) + 1), -(largest - second_largest))
        end
    end

    # Return the last stone or 0 if the heap is empty
    return isempty(heap) ? 0 : first(first(collect(keys(heap))))
end

last_stone_weight([2, 7, 4, 1, 8, 2])

## add your code here:
