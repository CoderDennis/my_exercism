defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.to_char_list
    |> Enum.reverse
    |> Stream.with_index
    |> Enum.reduce(0, fn(x, acc) -> binary_value(x) + acc end)
  end

  defp binary_value({?1, 0}), do: 1
  defp binary_value({?1, place}), do: 2 * binary_value({?1, place-1})
  defp binary_value(_), do: 0
end
