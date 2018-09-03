# api for the actor server
defmodule ApiCounter do
    def start(count) do
        # spawn this module (itself)
        spawn(__MODULE__, :loop, [count])
    end

    def next(pid) do
        send pid, {:next}
    end

    def rewind(pid) do
        send pid, {:rewind}
    end

    def loop(count) do
        receive do
            {:next} ->
                IO.puts("Current count: #{count}")
                loop(count + 1)
            {:rewind} ->
                IO.puts("Current count: #{count}")
                loop(count - 1)
        end
    end
end

# client
pid = ApiCounter.start(22)

ApiCounter.next(pid) # 22
Process.sleep(1000)

ApiCounter.next(pid) # 23
Process.sleep(1000)

ApiCounter.rewind(pid) # 24
Process.sleep(1000)

ApiCounter.rewind(pid) # 23
Process.sleep(1000)

ApiCounter.rewind(pid) # 22
Process.sleep(1000)