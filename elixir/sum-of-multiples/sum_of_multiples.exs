defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    factors
    |> Stream.flat_map(&multiples(&1, limit))
    |> Stream.uniq
    |> Enum.sum
  end

  defp multiples(n, limit) do
    Stream.iterate(n, &(&1 + n))
    |> Enum.take_while(&(&1 < limit))
  end
end
