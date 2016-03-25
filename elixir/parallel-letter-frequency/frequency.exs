defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Map
  def frequency([], _), do: %{}
  def frequency([text], _), do: frequency_for_text(text)
  def frequency(texts, _workers) do
    texts
    |> Enum.map(fn t -> Task.async(__MODULE__, :frequency_for_text, [t]) end)
    |> Task.yield_many()
    |> Enum.map(fn {_task, {:ok, result}} -> result end)
    |> Enum.reduce(fn(x, acc) ->
      Map.merge(acc, x, fn _k, v1, v2 ->
        v1 + v2
      end)
    end)
  end

  def frequency_for_text(text) do
    text
    |> String.strip
    |> String.downcase
    |> String.codepoints
    |> Enum.filter(&is_letter/1)
    |> frequency_of_letters(%{})
  end

  defp frequency_of_letters([], acc), do: acc
  defp frequency_of_letters([h | t], acc) do
    frequency_of_letters(t, Map.update(acc, h, 1, &(&1 + 1)))
  end

  defp is_letter(l) do
    String.downcase(l) != String.upcase(l)
  end

end

