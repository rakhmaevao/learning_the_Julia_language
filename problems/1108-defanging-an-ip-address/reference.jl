# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

defanging_ip_address(ip_address::String) = replace(ip_address, "." => "[.]")
