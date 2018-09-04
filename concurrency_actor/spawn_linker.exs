defmodule SpawnLinker do
    import :timer, only: [sleep: 1]

    def sad_function do
            sleep 500
            exit(:boom)
    end

    def run do
        # in case we dont trap the exit code, our output is: ** (EXIT from #PID<0.89.0>) :boom
        # which is none of our messages to display. This means, that we don't trap any messages when the process finish.
        Process.flag(:trap_exit, true)

        # If we spawn as usual, then we will get only "NOTHING HAPPEND", our client won't be notified about the death of our sad_function.
        # However, if we spawn_link, then we will get a notification (Only when we trap the exit, we will be able to process exit-messages)
        res = spawn_link(SpawnLinker, :sad_function, [])
        IO.puts inspect res # {#PID<0.94.0>, #Reference<0.1574448092.97779713.121224>}
        receive do
            # I can specify in these two ways the pattern matching.
            # 1. I can specify all the fields of the exit message.
            # 2. Or I can say that is just any trapped message (laster, inspecting, I see all the fields).
            # I can comment any of these two options and see the corresponding outputs
            {:EXIT, pid, reason} ->
                IO.puts "Reason: " <> to_string(reason) # Reason: boom
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}" # MESSAGE RECEIVED: {:EXIT, #PID<0.94.0>, :boom}
            after 1000 ->
                IO.puts "NOTHING HAPPEND"
        end
    end
end

SpawnLinker.run