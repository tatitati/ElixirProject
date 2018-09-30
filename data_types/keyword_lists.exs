
keywordlist = [a: "something", b: "whatever"]
IO.inspect(keywordlist) # [a: "something", b: "whatever"]


[something, something_else] = [a: "something", b: "whatever"]
IO.inspect something # {:a, "something"}
IO.inspect something_else # {:b, "whatever"}
