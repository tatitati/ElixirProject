# We want to transform this function using later capturing arguments
myfunction = fn (name, surname) ->
    IO.puts name <> " " <> surname
end
myfunction.("tati", "albert") # tati albert

# Now we do the same by using capturing arguments
myfunction = &(IO.puts &1 <> " " <> &2)
myfunction.("tati", "albert") # tati albert