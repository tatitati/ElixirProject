#
# MATCHING STRINGS
#

    # if you remember how we concat strings...
    IO.puts "anyname " <> "OTHER TEXT" #anyname OTHER TEXT

    # Matching parts of an string is kind of "explain how they are joined"
    # Example:
    # If I concact "Authentication" with a variable named "credentials", my final text would be: "Authentication: whatever text you want"
    # so we can know what that "credentials" value is
    "Authentication: " <> credentials = "Authentication: whatever text you want"
    IO.puts credentials # whatever text you want


#
# MATCHING LISTS
#
