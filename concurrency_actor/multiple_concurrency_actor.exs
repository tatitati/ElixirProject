defmodule GeeterListener do
    def greet do
        receive do
            {callerPid, msg} ->
                send callerPid, {:ok, "IM THE PROCESS!!!, HELLO #{msg}, I see your PID is:" <> inspect(callerPid)}
                greet # remember tail-call optimization dont create a new frame in the stack, is an special feature in elixir/scala. So there is no problem running out of memory
        end
    end
end

# the client send to the process..
pidProcess = spawn(GeeterListener, :greet, [])
IO.puts "spawned process: " <> inspect(pidProcess)

send pidProcess, {self, "world!!!!"}
# and the client receive response from the process...
receive do
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO world!!!!
end

send pidProcess, {self, "whatever!!!!"}
# and the client receive response from the process...
receive do
    {:ok, message} ->
        IO.puts message
    after 500 ->
        IO.puts "TIME OUT, NO RESPONSE FROM THE PROCESS"
end