defmodule CliTest do
    use ExUnit.Case
    # if this module is in a exs module then the import won't work. Elixir is compiled
    import Issues.Cli

    test "Alias for help option work" do
        assert parse_args(["-h", "anything"]) == :help
        assert parse_args(["-help", "anything"]) == :help
    end

    test "Parser can split all arguments" do
        assert parse_args(["One", "Two", "Three"]) == {"One", "Two", "Three"}
    end
end