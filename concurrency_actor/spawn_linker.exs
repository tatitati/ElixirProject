defmodule SpawnLinker do
    import :timer, only: [sleep: 1]

    def sad_function do
            sleep 500
            exit(:boom)
    end

    def run do
        # if we uncomment this line we will get "MESSAGE RECEIVED: EXIT FROM PID......". The output of the process will be converted to something that the client can handle (a msg)
        #Process.flag(:trap_exit, true)

        # If we spawn as usual, then we will get only "NOTHING HAPPEND", our client won't be notified about the death of our sad_function. 
        # However, if we spawn_link, then we will get a notification
        res = spawn_link(SpawnLinker, :sad_function, [])
        IO.puts inspect res # {#PID<0.94.0>, #Reference<0.1574448092.97779713.121224>}
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
            after 1000 ->
                IO.puts "NOTHING HAPPEND"
        end
    end
end

# IMPORTANT: THIS KILL THE PROCESS, NO MESSAGE LIKE "NOTHING HAPPEND, OR MESSAGE RECEIVED", spawn_link kill all linked process when one of the linked one die
SpawnLinker.run # ** (EXIT from #PID<0.89.0>) :boom