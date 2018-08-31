defmodule ParallelMap do
    def pmap(collection, fun) do
        me = self()
        collection
        |> Enum.map(fn (elem) ->
            spawn_link fn -> (send me, {self(), fun.(elem)}) end
            end)
        |> Enum.map(fn (pid) ->
            receive do { ^pid, result } ->
                result
            end
        end)

    end
end

output = ParallelMap.pmap 1..10, &(&1 * &1)
IO.inspect output # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]