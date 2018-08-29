
# concat strings
surname = "surname"
IO.puts "anyname " <> surname #anyname surname
IO.puts "anyname #{surname}" #anyname surname


# concat lists
a = [2, 3]
b = a ++ [4, 5]
IO.inspect(b) # [2, 3, 4, 5]

