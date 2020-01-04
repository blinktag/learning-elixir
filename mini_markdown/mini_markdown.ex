defmodule MiniMarkdown do
  def to_html(text) do
    # do lots of transforms in pipeline
    text
    |> p
    |> bold
    |> italics
    |> big
    |> small
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<i>\\1</i>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<b>\\1</b>")
  end

  def p(text) do
    Regex.replace(~r/(\r|\n|\r\n|^)+([^\r\n]+)((\r\n|\r|\n)$)?/, text, "<p>\\2</p>")
  end

  def big(text) do
    Regex.replace(~r/\+\+(.*)\+\+/, text, "<big>\\1</big>")
  end

  def small(text) do
    Regex.replace(~r/\-\-(.*)\-\-/, text, "<small>\\1</small>")
  end
end
