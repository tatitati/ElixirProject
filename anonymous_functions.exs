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


# using shortcuts (capturing arguments)
