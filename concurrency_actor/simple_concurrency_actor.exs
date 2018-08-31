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
send pidProcess, {self, "world!!!!"}

IO.puts "client process: " <> inspect(self)
IO.puts "spawned process: " <> inspect(pidProcess)


# and the client receive response from the process...
receive do
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO world!!!!
end