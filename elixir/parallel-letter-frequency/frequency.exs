defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Map
  def frequency([], _), do: %{}
  def frequency([text], _), do: frequency_for_text(text)
  def frequency(texts, workers) do

  end

  defp frequency_for_text(text) do
    text
    |> String.downcase
    |> String.codepoints
    |> frequency_of_letters(%{})
  end

  defp frequency_of_letters([], acc), do: acc
  defp frequency_of_letters([h | t], acc) do
    frequency_of_letters(t, Map.update(acc, h, 1, &(&1 + 1)))
  end

end

defmodule Frequency.Worker do
  use GenServer

  

end
