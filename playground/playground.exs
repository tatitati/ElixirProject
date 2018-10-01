defmodule MyModule do
    def loop(number) do
        receive do
            {originId, :increase, msg} ->                 
                send originId, {:ok, number}
                
        end
        loop(number + 1)
    end
end

pid = spawn(MyModule, :loop, [34])


####### First message
send(pid, {self(), :increase,  "response One"})
receive do 
    {:ok, number} -> IO.puts number # 34
end

####### Second message
send(pid, {self(), :increase,  "response Two"})
receive do 
    {:ok, number} -> IO.puts number # 35
end