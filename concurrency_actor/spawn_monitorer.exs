defmodule SpawnMonitorer do
    import :timer, only: [sleep: 1]

    def sad_function do
            sleep 500
            exit(:boom)
    end

    def run do
        # spawn_link is bidirectional, each process can send notification when one of them die. However, spawn_monitor is unidirectional, one way.
        spawn_monitor(SpawnMonitorer, :sad_function, [])
        receive do
            msg ->
                IO.puts "MSG: #{inspect msg}"
            after 1000 ->
                IO.puts "NOTHING HAPPEND"
        end
    end
end

# IMPORTANT: spawn monitor doesn't kill all processes attached when the monitored one dies (as it does spawn_link), this is obvious as is printed messages
# like "MSG OR NOTHING HAPPENED"
SpawnMonitorer.run # MSG: {:DOWN, #Reference<0.1574448092.97779713.121224>, :process, #PID<0.94.0>, :boom}