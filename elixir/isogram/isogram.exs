defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.downcase
    |> String.graphemes
    |> Enum.filter(&is_letter?/1)
    |> isogram?(MapSet.new)
  end

  defp isogram?([], _), do: true
  defp isogram?([h|t], found) do
    if MapSet.member?(found, h) do
      false
    else
      isogram?(t, MapSet.put(found, h))
    end
  end

  defp is_letter?(l) do
    String.downcase(l) != String.upcase(l)
  end

end
