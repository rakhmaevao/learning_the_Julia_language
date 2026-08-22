# Шаблон решения задачи 2. Add Two Numbers
# Запуск тестов:  ./leet test 2

using LeetKit.Support

function add_two_numbers(l1::ListNode, l2::ListNode)::ListNode
    sum = l1.val + l2.val
    current_digit = sum - 10
    overflow = 0
    if sum >= 10
        overflow = 1
        current_digit = sum - 10
    else
        overflow = 0
        current_digit = sum
    end
    result = ListNode(current_digit)
    current_node_result = result
    while true
        if !isnothing(l1)  
            l1 = l1.next
        end
        
        if !isnothing(l2)
            l2 = l2.next
        end
        
        if (isnothing(l1) && isnothing(l2))
            if overflow != 0
                current_node_result.next = ListNode(overflow)
            end
            break
        elseif isnothing(l1)
            d1 = 0
            d2 = l2.val
        elseif isnothing(l2)
            d1 = l1.val
            d2 = 0

        else
            d1 = l1.val
            d2 = l2.val
        end

        sum = d1 + d2 + overflow
        
        if sum >= 10
            overflow = 1
            current_digit = sum - 10
        else
            overflow = 0
            current_digit = sum
        end
        current_node_result.next = ListNode(current_digit)
        current_node_result = current_node_result.next
    end
    return result
end
