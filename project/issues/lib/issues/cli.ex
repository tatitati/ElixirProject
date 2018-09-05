defmodule Issues.Cli do
    def parse_args(argv) do
        parse = OptionParser.parse!(argv,
            switches: [help: :boolean],
            aliases: [h: :help]
        )

        case parse do
            # parse =  {[help: true], ["anything"]}
            {[help: true], _ } -> :help

            # parse = {[], ["One", "Two", "Three"]}
            {_ , [arg1, arg2, arg3]} -> {arg1, arg2, arg3}
        end
    end
end