#######
myfirstfunction = fn name -> IO.puts("hello " <> name) end
myfirstfunction.("maria") # hello maria


#######
myfirstfunctionMultiline = fn name -> 
    IO.puts("hello " <> name) 
end
myfirstfunctionMultiline.("eva") # hello eva


#######
priceCalculatorLambda = fn orderPrice, ivaCalculator -> orderPrice + ivaCalculator.(orderPrice) end

ivaLambda = fn orderPrice -> orderPrice * 2 / 100 end
IO.puts(priceCalculatorLambda.(34, ivaLambda)) # 34.68

#
#(capturing arguments)
# 

# We want to transform this function using later capturing arguments
myfunction = fn (name, surname) ->
    IO.puts name <> " " <> surname
end
myfunction.("tati", "albert") # tati albert

# 
myfunction = &(IO.puts &1 <> " " <> &2)
myfunction.("tati", "albert") # tati albert