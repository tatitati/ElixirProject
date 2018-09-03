defmodule Talker do
    def loop do 
        receive do 
            {:greet, name} -> IO.puts("Hello #{name}!!!")
            {:bye, name} -> IO.puts("Bye #{name}!!!")
            {:congrats, name} -> IO.puts("Congrats #{name}!!!")
        end
        loop
    end
end


## run actor server

pid = spawn(Talker, :loop, [])

## execute client
send(pid, {:greet, "Francisco"} # CLI output: Hello Francisco!!!


