defmodule BidirectionalCounter do
    def start(count) do
        spawn(__MODULE__, :loop, [count])
    end

    def next(pid_counter) do
        ref = make_ref()
        # self() === PID<0.89.0>
        # ref === Reference<0.3075104721.1116995585.147357>
        send pid_counter, {:next_loop, self(), ref}
        receive do # kind of promisises......
            {:ok, ^ref, count} -> IO.puts count
        end
    end

    def loop(count) do
        receive do
            {:next_loop, sender, ref} ->
                send(sender, {:ok, ref, count})
                loop(count + 1)
        end
    end
end


pid = BidirectionalCounter.start(23)

BidirectionalCounter.next(pid)
Process.sleep(1000)

BidirectionalCounter.next(pid)
Process.sleep(1000)

BidirectionalCounter.next(pid)
Process.sleep(1000)