words =
  IO.gets("File to count the words from: ")
  |> String.trim()
  |> File.read!()
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count()

IO.puts("There are #{words} words\n")
