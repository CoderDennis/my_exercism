defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1 do
    raise "count must be greater than zero."
  end
  def nth(count) do
    primes()
    |> Stream.drop(count - 1)
    |> Stream.take(1)
    |> Enum.to_list()
    |> List.first
  end

  @docp """
    generates infinate sequence of prime numbers
  """
  defp primes() do
    Stream.resource(
      fn -> {[], 2} end,
      fn {[], 2} ->
           {[2], {[2], 3}}
         {primes_found, val} ->
           primes_up_to_square_root =
             Stream.take_while(primes_found, &(&1 <= :math.sqrt(val)))
           if Enum.any?(primes_up_to_square_root, &(rem(val,&1) == 0)) do
             {[], {primes_found, val + 2}}
           else
             {[val], {primes_found ++ [val], val + 2}}
           end
      end,
      fn _ -> nil end
      )
  end

end
