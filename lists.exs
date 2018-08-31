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