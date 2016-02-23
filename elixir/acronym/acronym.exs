defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/([a-z])([A-Z])/, "\\1 \\2")
    |> String.split(~r/[ -]/)
    |> Enum.map(&String.first/1)
    |> to_string
    |> String.upcase
  end
end