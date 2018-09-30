[valueA, valueB, valueC] = [12, 23, 45] # pattern matching, no conditions about values, just based in structure
IO.puts valueA # 12

[12, valueB, valueC] = [12, 23, 45] 
IO.puts valueA # 12

[_, valueB, _] = [12, 23, 45]
IO.puts valueB # 23





#
# Head and Tail
#
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