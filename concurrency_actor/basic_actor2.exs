defmodule GeeterListener do
    def greet do
        receive do
            {callerPid, msg} ->
                send callerPid, {:ok, "IM THE PROCESS!!!, HELLO #{msg}, I see your PID is:" <> inspect(callerPid)}
        end
    end
end

# the client send to the process..
pidProcess = spawn(GeeterListener, :greet, [])


IO.puts "client process: " <> inspect(self()) # client process: #PID<0.89.0>
IO.puts "spawned process: " <> inspect(pidProcess) # spawned process: #PID<0.94.0>


send pidProcess, {self(), "world!!!!"}
receive do
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO world!!!!, I see your PID is:#PID<0.89.0>
end