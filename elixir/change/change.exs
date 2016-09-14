defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(_, []), do: :error
  def generate(amount, values) do
    change_from_sorted_coins(amount, Enum.sort(values))
  end

  @spec change_from_sorted_coins(integer, list) :: {:ok, map} | :error
  defp change_from_sorted_coins(amount, [smallest_coin | _]) when amount < smallest_coin, do: :error
  defp change_from_sorted_coins(amount, values) do
    { :ok,
      Map.merge(
        Map.new(values, &({&1, 0})),
        change_from_reverse_sorted_coins(amount, Enum.reverse(values))
      )
    }
  end

  defp change_from_reverse_sorted_coins(0, []), do: %{}
  defp change_from_reverse_sorted_coins(_, []), do: :error
  defp change_from_reverse_sorted_coins(amount, [largest_coin | coins]) do
    largest_coin_count = div amount, largest_coin
    remaining_amount = rem amount, largest_coin
    case change_from_reverse_sorted_coins(remaining_amount, coins) do
      :error -> change_from_reverse_sorted_coins(amount, coins)
      change -> Map.merge(%{largest_coin => largest_coin_count}, change)
    end
  end

end
