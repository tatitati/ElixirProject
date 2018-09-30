
a = {:ok, 42, "next"}
IO.inspect a # {:ok, 42, "next"}

{status, count, action} = {:ok, 42, "next"}
IO.puts count # 42

{status, 42, action} = {:ok, 42, "next"}
IO.puts status # ok

{status, _, _} = {:ok, 42, "next"}
IO.puts status # ok