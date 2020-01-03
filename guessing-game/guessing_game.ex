defmodule GuessingGame do
  @doc """
  Hnadle case where user enters lower value which is greather than the high value
  """
  def guess(a, b) when a > b do
    guess(b, a)
  end

  def guess(low, high) do
    answer =
      IO.gets("Are you thinking of #{mid(low, high)}?\n")
      |> String.trim()

    case(String.trim(answer)) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number"

      _ ->
        IO.puts(~s(Type "bigger", "smaller", or "yes"))
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
