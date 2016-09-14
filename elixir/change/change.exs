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
    values
    |> Enum.sort
    |> Enum.reverse
    |> change_from_reverse_sorted_coins(amount)
    |> ensure_all_values_included(values)
  end

  @spec change_from_reverse_sorted_coins(list, integer) :: map | :error
  defp change_from_reverse_sorted_coins([], 0), do: %{}
  defp change_from_reverse_sorted_coins([], _), do: :error
  defp change_from_reverse_sorted_coins([largest_coin | coins], amount) do
    largest_coin_count = div amount, largest_coin
    remaining_amount = rem amount, largest_coin
    case change_from_reverse_sorted_coins(coins, remaining_amount) do
      :error -> change_from_reverse_sorted_coins(coins, amount)
      change -> Map.merge(%{largest_coin => largest_coin_count}, change)
    end
  end

  @spec ensure_all_values_included(:error | map, list) :: {:ok, map} | :error
  defp ensure_all_values_included(:error, _), do: :error
  defp ensure_all_values_included(result, values) do
    {:ok, Map.merge(Map.new(values, &({&1, 0})), result)}
  end

end
