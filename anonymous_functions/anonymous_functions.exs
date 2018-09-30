####### Declaration in one line
myfirstfunction = fn name -> IO.puts("hello " <> name) end
myfirstfunction.("maria") # hello maria


####### Declaration in multiline
myfirstfunctionMultiline = fn name -> 
    IO.puts("hello " <> name) 
end
myfirstfunctionMultiline.("eva") # hello eva

