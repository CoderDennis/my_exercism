defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.split(~r/[\s_]/, trim: true)
    |> Enum.map(&strip_punctuation(&1))
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&(String.downcase(&1)))
    |> count(%{})
  end

  defp count([], dict) do
    dict
  end
  defp count([h|t], dict) do
    dict = Dict.update(dict, h, 1, fn(val) -> val + 1 end)
    count(t, dict)
  end

  defp strip_punctuation(string) do
    String.replace(string, ~r/(^[^\w]+|[^\w]+$)/, "")
  end
end
