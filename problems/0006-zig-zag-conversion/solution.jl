# Шаблон решения задачи 6. ZigZag Conversion
# Запуск тестов:  ./leet test 6

using LeetKit.Support

function zig_zag_convert(s::String, num_rows::Int)::String
    println("INPUT $s $num_rows")
    zeros_column = Matrix{Char}(zeros(num_rows, 1))
    result_matrix = copy(zeros_column)
    row_number, column_number = 1, 1
    for character in collect(s)
        println("New iteration for $character $row_number $column_number")
        display(result_matrix)
        result_matrix[row_number, column_number] = character
        if num_rows != 1 && ((column_number-1)  % (num_rows-1) == 0)
            row_number += 1
            if row_number > num_rows
                adding = column_number == 1 ? 1 : 0
                column_number += 1
                row_number = num_rows - (column_number % num_rows) + adding
                if row_number > num_rows
                    row_number = 1
                end
                result_matrix = [result_matrix copy(zeros_column)]
            end
        else
            column_number += 1
            adding = column_number < num_rows ? 1 : 0
            row_number = num_rows - (column_number % num_rows) + adding
            result_matrix = [result_matrix zeros_column]
            if (column_number % num_rows == 0)
                row_number = 1
            end
        end
    end
    result_str = ""
    rows, columns = size(result_matrix)
    for r in 1:rows
        for c in 1:columns
            if result_matrix[r, c] == '\0'
                continue
            end
            result_str *= result_matrix[r, c]
        end
    end
    display("RES \n$result_matrix")
    return result_str
end
