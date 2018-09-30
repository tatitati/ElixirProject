[head | tail] = ["valueA", "valueB", "valueC", "valueD"]
IO.inspect head # "valueA"
IO.inspect tail # ["valueB", "valueC", "valueD"]


[head | tail] = ["valueA"]
IO.inspect head # "valueA"
IO.inspect tail # []

# head and tail are just name variables
[maria | manolo] = ["valueA", "valueB", "valueC", "valueD"]
IO.inspect maria # "valueA"
IO.inspect manolo # ["valueB", "valueC", "valueD"]

# you can unpack a list (actually this is doing pattern matching)
list = [12, 23, 45]
[valueA, valueB, valueC] = list # pattern matching, no conditions about values, just based in structure
IO.puts valueA # 12

list = [12, 23, 45]
[12, valueB, valueC] = list # pattern matching, conditions about values, not only about structure
# [100, valueB, valueC] = list # error!
IO.puts valueA # 12

list = [12, 23, 45]
[_, valueB, _] = list # pattern matching, sometimes you don't want to unpack all the values, just match one particular (use less memory)
IO.puts valueB # 23

# a more obvious pattern matching with list
list = [12, 23, [323, 55]]
[valueA, valueB, valueC] = list
IO.puts inspect(valueC) # [323, 55]
