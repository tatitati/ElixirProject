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

    def process(:help) do
        IO.puts """
            usage: issues <user> <project> [ count | 4 ]
        """

        System.halt(0)
    end

    def process({user, project, _count}) do
        Issues.GithubIssues.fetch(user, project)
    end

    def run(argv) do
        argv
            |> parse_args
            |> process
    end
end