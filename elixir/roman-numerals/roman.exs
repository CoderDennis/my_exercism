defmodule Roman do

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> Integer.digits
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.map(&convert_digit/1)
    |> Enum.reduce(fn(x, acc) -> x <> acc end)
  end

  defp convert_digit({digit, 0}), do: get_numerals(digit, ["I", "V", "X"])
  defp convert_digit({digit, 1}), do: get_numerals(digit, ["X", "L", "C"])
  defp convert_digit({digit, 2}), do: get_numerals(digit, ["C", "D", "M"])
  defp convert_digit({digit, 3}), do: get_numerals(digit, ["M", "-", "-"])

  defp get_numerals(0, _), do: ""
  defp get_numerals(4, [one, five, _ten]), do: one <> five
  defp get_numerals(9, [one, _five, ten]), do: one <> ten
  defp get_numerals(x, [one, _five, _ten] = numerals) when x < 4 do
    one <> get_numerals(x-1, numerals)
  end
  defp get_numerals(x, [_one, five, _ten] = numerals) do
    five <> get_numerals(x-5, numerals)
  end
end
