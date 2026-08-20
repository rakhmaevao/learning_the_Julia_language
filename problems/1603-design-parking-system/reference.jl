# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

struct ParkingSystem
    A::Vector{Int}
    ParkingSystem(big, median, small) = new([big, median, small])
end

function add_car(parking::ParkingSystem, car_type::Int)::Bool
    parking.A[car_type] -= 1
    return parking.A[car_type] >= 0
end
