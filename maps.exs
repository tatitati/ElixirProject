#
# Extracting values from maps using pattern matching
#
abilities = %{strength: 16, intelligence: 10, name: "terminator"}
%{intelligence: value} = abilities # like in string we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
IO.inspect value # 10


#
# Extracting conditionally
#

# we can set conditions when matching and in this way extract conditionally:
%{intelligence: val = 10} = abilities # like in string we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
IO.inspect val # 10

%{intelligence: val = 20} = abilities # like in string we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
IO.inspect val # error

