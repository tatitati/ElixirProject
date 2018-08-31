defmodule ParallelMap do
    def pmap(collection, operation) do
        me = self()
        collection
        |> Enum.map(fn (elem) ->
            # I run the operatio over each item in the map in a parallel process on the fly
            spawn_link fn -> (send me, {self(), operation.(elem)}) end # this create a list of PIDs, used (as they are returned) by the next step in the map
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