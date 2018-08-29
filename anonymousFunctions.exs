#######

hello = fn name -> IO.puts("hello " <> name) end

helloMultiline = fn name -> 
    IO.puts("hello " <> name) 
end

hello.("maria") # hello maria
helloMultiline.("eva") # hello eva


#######

ivaLambda = fn orderPrice -> orderPrice * 2 / 100 end
priceCalculatorLambda = fn orderPrice, ivaCalculator -> orderPrice + ivaCalculator.(orderPrice) end

IO.puts(priceCalculatorLambda.(34, ivaLambda)) # 34.68