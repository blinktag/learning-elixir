defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italicizes" do
    assert AlchemyMarkdown.to_html("*Hello* there!") =~ "<em>Hello</em>"
  end

  test "expans big tags" do
    str = "Some ++big++ words!"
    assert AlchemyMarkdown.to_html(str) =~ "<big>big</big>"
  end

  test "expans small tags" do
    str = "Some --small-- words!"
    assert AlchemyMarkdown.to_html(str) =~ "<small>small</small>"
  end

  test "expands hr tags" do
    str1 = "Stuff over the line\n---"
    str2 = "Stuff over the line\n***"
    str3 = "Stuff over the line\n* * *"
    str4 = "Stuff over the line\n- - -"

    Enum.each(
      [str1, str2, str3, str4],
      fn str -> assert AlchemyMarkdown.hrs(str) == "Stuff over the line\n<hr />" end
    )

    str5 = "Stuff over the line*  *  *"

    assert AlchemyMarkdown.hrs(str5) == str5
  end
end
