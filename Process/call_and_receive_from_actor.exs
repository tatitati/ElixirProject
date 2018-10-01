defmodule GeeterListener do
    def greet do
        receive do
            {callerPid, msg} ->
                send callerPid, {:ok, "IM THE PROCESS!!!, HELLO #{msg}, I see your PID is:" <> inspect(callerPid)}
                greet # remember tail-call optimization dont create a new frame in the stack, is an special feature in elixir/scala. So there is no problem running out of memory
        end
    end
end


pidProcess = spawn(GeeterListener, :greet, [])


#
#  Send and recieve....
#
send pidProcess, {self, "world!!!!"}
receive do
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO world!!!!
end

#
#  Send and recieve....
#
send pidProcess, {self, "whatever!!!!"}
receive do
    {:ok, message} ->
        IO.puts message # IM THE PROCESS!!!, HELLO whatever!!!!
    after 500 ->
        IO.puts "TIME OUT, NO RESPONSE FROM THE PROCESS"
end