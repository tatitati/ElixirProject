simple_map = %{"result" => "good", "action" => "delete" }
IO.inspect simple_map["result"] # good

# if keys are set in the map as atoms, then you can access by using atom values and use : notation
simple_map = %{result: "good", action: "delete" }
IO.inspect simple_map[:result] # good

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

# like in string we can say: "abilities has a field in the format "intelligence: <something>", what is the value of that something?
#%{intelligence: val = 20} = abilities 
#IO.inspect val # error

