abilities = %{strength: 16, intelligence: 10, name: "terminator"}
# like in streing we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
%{intelligence: value} = abilities

IO.inspect value # 10