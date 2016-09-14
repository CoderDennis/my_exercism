defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.to_integer
    |> Integer.digits
    |> Enum.reverse
    |> sum_digits(false, 0)
  end

  @spec sum_digits(list, boolean, integer) :: integer
  defp sum_digits([], _, sum), do: sum
  defp sum_digits([h|t], true, sum) do
     sum_digits(t, false, sum + adjust_double(h * 2))
  end
  defp sum_digits([h|t], false, sum) do
    sum_digits(t, true, sum + h)
  end

  defp adjust_double(double) when double > 9, do: double - 9
  defp adjust_double(double), do: double

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    0 == number
         |> checksum
         |> rem(10)
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    check_digit = checksum(number <> "0")
                  |> rem(10)
                  |> adjust_check_digit
    "#{number}#{check_digit}"
  end

  defp adjust_check_digit(0), do: 0
  defp adjust_check_digit(remainder), do: 10 - remainder

end
