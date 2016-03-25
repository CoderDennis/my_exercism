defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(fn row_str ->
      row_str
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows()
    |> columns_from_rows()
  end

  defp columns_from_rows(rows) do
    rows
    |> Enum.reduce(&Enum.zip/2)
    |> Enum.map(&tuples_to_list/1)
  end

  defp tuples_to_list({x, t}) when is_tuple(t), do: tuples_to_list(t) ++ [x]
  defp tuples_to_list({x, y}), do: [y | [x]]

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)

  end

  defp max_with_index(list) do
    list
    |> Enum.with_index()
    |> Enum.max_by(fn {v, _i} -> v end)
  end
end