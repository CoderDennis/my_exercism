defmodule Raindrops do

  @output_strings %{3 => "Pling",
                    5 => "Plang",
                    7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case do_convert(number) do
      ""  -> Integer.to_string(number)
      val -> val
    end
  end

  defp do_convert(number) do
    @output_strings
    |> Enum.filter_map(fn {x, _} -> rem(number, x) == 0 end,
                       fn {_, output} -> output end)
    |> Enum.join
  end
end
