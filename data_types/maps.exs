# Using strings as keys: 
simple_map = %{"result" => "good", "action" => "delete" }  # or %{"result" : "good", "action" : "delete" }
IO.inspect simple_map["result"] # good
IO.inspect simple_map[:result] # nil


# Using atoms as keys
simple_map = %{:result => "good", :action => "delete" } # or %{result: "good", action: "delete" }
IO.inspect simple_map["result"] # nil
IO.inspect simple_map[:result] # good
IO.inspect simple_map.result # good

#
# Pattern matching
#
%{intelligence: value} = %{strength: 16, intelligence: 10, name: "terminator"}
IO.inspect value # 10


%{intelligence: value, strength: 16} = %{strength: 16, intelligence: 10, name: "terminator"}
IO.inspect value # 10


%{intelligence: val = 10} = %{strength: 16, intelligence: 10, name: "terminator"}
IO.inspect val # 10

