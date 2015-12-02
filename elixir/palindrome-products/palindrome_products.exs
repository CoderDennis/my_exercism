defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map()
  def generate(max_factor, min_factor \\ 1) do
    (for x <- min_factor..max_factor,
         y <- min_factor..x,
         palindromic?(x*y),
         do: [y, x])
    |> Enum.group_by(fn [x, y] -> x * y end)
  end

  defp palindromic?(num) do
    digits = Integer.digits(num)
    digits == Enum.reverse(digits)
  end
end
