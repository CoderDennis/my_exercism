defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    2..limit
    |> Enum.map(&({&1, :unknown}))
    |> sieve
    |> Enum.filter_map(fn {_, state} -> state == :prime end,
                       fn {p, _} -> p end)
  end

  defp sieve(map) do
    case Enum.find(map, :end, fn {_, state} -> state == :unknown end) do
      :end    -> map
      {prime, :unknown} ->
        sieve(Enum.map(map, fn
            {p, _} when p == prime -> {p, :prime}
            {x, :unknown} when rem(x,prime) == 0 -> {x, :composite}
            elem -> elem
          end))
    end
  end
end
