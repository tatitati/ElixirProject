#
# Extracting values from maps using pattern matching
#
abilities = %{strength: 16, intelligence: 10, name: "terminator"}
%{intelligence: value} = abilities # like in streing we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
IO.inspect value # 10



