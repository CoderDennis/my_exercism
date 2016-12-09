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
    |> sum_digits(1, 0)
  end

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

  @spec sum_digits(list, integer, integer) :: integer
  defp sum_digits([], _, sum), do: sum
  defp sum_digits([h|t], multiple, sum) do
     sum_digits(t, next_multiple(multiple), sum + adjust_digit(h * multiple))
  end

  # alternates between values 1 and 2
  defp next_multiple(multiple) do
    abs(multiple - 3)
  end

  defp adjust_digit(digit) when digit > 9, do: digit - 9
  defp adjust_digit(digit), do: digit

  defp adjust_check_digit(0), do: 0
  defp adjust_check_digit(remainder), do: 10 - remainder

end
