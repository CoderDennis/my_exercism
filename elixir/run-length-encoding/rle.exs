defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> do_encode(1)
  end

  @spec do_encode([String.codepoint], integer) :: String.t
  defp do_encode([], _), do: ""
  defp do_encode([h|t], count) when h == hd(t), do: do_encode(t, count+1)
  defp do_encode([h|t], count), do: "#{count}#{h}" <> do_encode(t, 1)

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.replace(~r/(\d+)(\w)/, string,
      fn _, count, val ->
        String.duplicate(val, String.to_integer(count))
      end)
  end

end
