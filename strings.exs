# immutable data????? : 
# in Elixir you can rebind variables (change the meaning of the "label"), mainly for your convenience:
# ......so......YOU CANNOT MODIFY IT, BUT YOU CAN RE-BIND A VARIABLE (change the whole reference of a variable). Well, like Value objects, you cannot modify them, 
# but you can always overwrite your varaible with another value object
a = "somethingA "
a = a <> "somethinbB"
IO.inspect(a) # "somethingA somethingB"



# concat strings
surname = "surname"
IO.puts "anyname " <> surname #anyname surname
IO.puts "anyname #{surname}" #anyname surname

#
# extracting value with pattern matching
#
# if you remember how we concat strings...
IO.puts "anyname " <> "OTHER TEXT" #anyname OTHER TEXT

# Matching parts of an string is kind of "explain how they are joined"
# Example:
# If I concact "Authentication" with a variable named "credentials", my final text would be: "Authentication: whatever text you want"
# so we can know what that "credentials" value is
"Authentication: " <> credentials = "Authentication: whatever text you want"
IO.puts credentials # whatever text you want


