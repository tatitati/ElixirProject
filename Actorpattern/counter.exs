defmodule Counter do
    def loop(count) do
        receive do
            {:next} ->
                IO.inspect count
                loop(count + 1)

        end
    end
end

# run actor server
pid = spawn(Counter, :loop, [22])

# run client
send pid, {:next} # 22
Process.sleep(1000)

send pid, {:next} # 23
Process.sleep(1000)

send pid, {:next} # 24
Process.sleep(1000)