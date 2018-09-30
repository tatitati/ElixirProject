#######
myfirstfunction = fn name -> IO.puts("hello " <> name) end

myfirstfunctionMultiline = fn name -> 
    IO.puts("hello " <> name) 
end

myfirstfunction.("maria") # hello maria
myfirstfunctionMultiline.("eva") # hello eva


#######
ivaLambda = fn orderPrice -> orderPrice * 2 / 100 end
priceCalculatorLambda = fn orderPrice, ivaCalculator -> orderPrice + ivaCalculator.(orderPrice) end

IO.puts(priceCalculatorLambda.(34, ivaLambda)) # 34.68