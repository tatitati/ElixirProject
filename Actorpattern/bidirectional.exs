defmodule Bidirectional do
    def start(count) do
        spawn(__MODULE__, :loop, [count])
    end

    def next(pid) do
        ref = make_ref() 
        # self() === PID<0.89.0>
        # ref === Reference<0.3075104721.1116995585.147357>
        send pid, {:next, self(), ref}
        receive do
            {:ok, ^ref, count} -> IO.puts count
        end
    end

    def loop(count) do
        receive do
            {:next, sender, ref} ->
                send(sender, {:ok, ref, count})
                loop(count + 1)
        end
    end
end


pid = Bidirectional.start(23)

Bidirectional.next(pid)
Process.sleep(1000)

Bidirectional.next(pid)
Process.sleep(1000)

Bidirectional.next(pid)
Process.sleep(1000)