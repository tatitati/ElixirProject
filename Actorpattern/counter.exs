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
pid = spawn(Counter, :loop, [1])

# run client
send pid, {:next}
Process.sleep(1000)
send pid, {:next}
Process.sleep(1000)
send pid, {:next}