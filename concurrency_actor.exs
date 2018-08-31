defmodule SpawnBasic do
    def greet do
        receive do
            {callerPid, msg} ->
                send callerPid, {:ok, "IM THE PROCESS!!!, HELLO #{msg}"}
        end
    end
end

# the client send to the process..
pidProcess = spawn(SpawnBasic, :greet, [])
send pidProcess, {self, "world!!!!"}

IO.inspect pidProcess
IO.inspect self

# and the client receive response from the process...
receive do 
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO world!!!!
end