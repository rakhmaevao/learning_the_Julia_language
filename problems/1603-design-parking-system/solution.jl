# Шаблон решения задачи 1603. Design Parking System
# Запуск тестов:  ./leet test 1603

using LeetKit.Support

struct ParkingSystem
    A::Vector{Int}
    ParkingSystem(big, median, small) = begin
            new([big, median, small])
        end
end

function add_car(parking::ParkingSystem, car_type::Int)::Bool
    # TODO: напишите своё решение
    error("Задача ещё не решена: add_car")
end
