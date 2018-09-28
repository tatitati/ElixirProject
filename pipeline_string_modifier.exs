defmodule StringModifier do
    def perform(originalString, textToAppend) do
        modifiedText = originalString
            |> String.split(" ")
            |> Enum.map(&String.capitalize/1)
            |> Enum.join("__")
            |> IO.inspect(label: "after joining") # inspect allow an special argument "label" to help to identify where in the pipeline is the process. The pipeline still works because Inspect return the first arguments we pass it
            |> appendCustomText(textToAppend) # we can pass arguments to specific steps in the pipeline
            |> IO.inspect(label: "final result")
    end

    def appendCustomText(text, textToAppend) do
        text <> textToAppend
    end

end

StringModifier.perform("hello world", "AAAAAAAAAAAAAA")
# CLI output:
# after joining: "Hello__World"
# final result: "Hello__WorldAAAAAAAAAAAAAA"
