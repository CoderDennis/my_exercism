defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    factors
    |> Enum.flat_map(fn(f) ->
                       Stream.iterate(f, &(&1 + f))
                       |> Enum.take_while(&(&1 < limit))
                     end)
    |> Enum.sum
  end


end
