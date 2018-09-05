defmodule Issues.Cli do
    def parse_args(argv) do
        parse = OptionParser.parse!(argv,
            switches: [help: :boolean],
            aliases: [h: :help]
        )
        IO.inspect parse
        case parse do
            # parse =  {[help: true], ["anything"]}
            {[help: true], [topic] } -> { :help,  topic}

            # parse = {[], ["One", "Two", "Three"]}
            {_ , [arg1, arg2, arg3]} -> {arg1, arg2, String.to_integer(arg3)}

            # parse = {[], ["One", "Two"]}
            {_ , [arg1, arg2]} -> {arg1, arg2, 4}
        end
    end
end