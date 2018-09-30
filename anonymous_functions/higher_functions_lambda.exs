#######
priceCalculatorLambda = fn orderPrice, ivaCalculator -> orderPrice + ivaCalculator.(orderPrice) end

ivaLambda = fn orderPrice -> orderPrice * 2 / 100 end
IO.puts(priceCalculatorLambda.(34, ivaLambda)) # 34.68