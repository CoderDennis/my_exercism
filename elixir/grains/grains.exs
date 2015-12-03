defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    Enum.reduce(1..number, fn(_x, acc) -> acc * 2 end)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    1..64
    |> Enum.map(&square/1)
    |> Enum.sum
  end
end
