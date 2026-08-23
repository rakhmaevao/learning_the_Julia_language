# Шаблон решения задачи 4. Median of Two Sorted Arrays
# Запуск тестов:  ./leet test 4

using LeetKit.Support

function find_median_sorted_arrays(nums1::Vector{Int}, nums2::Vector{Int})::Float64
    result_vector = []
    i_1, i_2 = 1, 1
    while true
        num1 = i_1 <= length(nums1) ? nums1[i_1] : Inf
        num2 = i_2 <= length(nums2) ? nums2[i_2] : Inf

        if isinf(num1) && isinf(num2)
            break
        end

        if num1 <= num2
            append!(result_vector, num1)
            i_1 = i_1 + 1
        else
            append!(result_vector, num2)
            i_2 = i_2 + 1
        end
    end

    len = length(result_vector)

    if isodd(len)
        return result_vector[Integer(ceil(len / 2))]
    else
        return (result_vector[Integer(len / 2)] + result_vector[Integer(len / 2) + 1]) / 2
    end
end

