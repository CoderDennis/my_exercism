defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base = String.downcase(base)
    candidates
    |> Enum.filter(&(is_anagram?(String.downcase(&1),base)))
  end

  defp is_anagram?(x, x), do: false
  defp is_anagram?(x, y), do: to_sorted_list(x) == to_sorted_list(y)

  defp to_sorted_list(string) do
    string
    |> to_char_list
    |> Enum.sort
  end
end
