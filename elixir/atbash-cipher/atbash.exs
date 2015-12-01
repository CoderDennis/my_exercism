defmodule Atbash do

  import String, only: [downcase: 1, replace: 3]

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> downcase
    |> remove_punctuation
    |> to_char_list
    |> Enum.map(&encode_char/1)
    |> Enum.chunk(5, 5, [])
    |> Enum.intersperse(" ")
    |> Enum.join
  end

  defp encode_char(c) when c < ?a, do: c
  defp encode_char(c), do: ?z - c + ?a

  defp remove_punctuation(s), do: replace(s, ~r/[^\w]/, "")
end
