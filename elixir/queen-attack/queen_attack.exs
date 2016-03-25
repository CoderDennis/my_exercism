defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new(nil | list) :: Queens.t()
  def new(), do: new(white: {0, 3}, black: {7, 3})
  def new([white: {x, y}, black: {x, y}]), do: raise ArgumentError
  def new([white: white, black: black]) do
    %Queens{white: white, black: black}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    Enum.map(0..7, fn x ->
      Enum.map(0..7, fn y ->
        board_char(queens, {x, y})
      end) |> Enum.join(" ")
    end) |> Enum.join("\n")
  end

  defp board_char(%Queens{white: {x, y}}, {x, y}), do: "W"
  defp board_char(%Queens{black: {x, y}}, {x, y}), do: "B"
  defp board_char(_, _), do: "_"

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: {x, _}, black: {x, _}}), do: true
  def can_attack?(%Queens{white: {_, y}, black: {_, y}}), do: true
  def can_attack?(%Queens{white: {wx, wy}, black: {bx, by}})
    when abs(wx - bx) == abs(wy - by), do: true
  def can_attack?(_queens), do: false
end
