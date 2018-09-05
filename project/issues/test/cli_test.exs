defmodule CliTest do
    use ExUnit.Case

    test "My first test" do
        assert Issues.Cli.parse_args(["-h", "anything"]) == :help
    end

end