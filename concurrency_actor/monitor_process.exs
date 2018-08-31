defmodule SuiciderProcess do
    import :timer, only: [sleep: 1]

    def sad_function do
            sleep 500
            exit(:boom)
    end

    def run do
        # spawn_link is bidirectional, each process can send notification when one of them die. However, spawn_monitor is unidirectional, one way.
        spawn_monitor(SuiciderProcess, :sad_function, [])
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
            after 1000 ->
                IO.puts "NOTHING HAPPEND"
        end
    end
end

SuiciderProcess.run # MESSAGE RECEIVED: {:DOWN, #Reference<0.1574448092.97779713.121224>, :process, #PID<0.94.0>, :boom}