defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    num = number - 1
    bottles = num_bottles(num)
    """
#{String.capitalize(bottles)} of beer on the wall, #{bottles} of beer.
#{action(num)}, #{num_bottles(num - 1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  defp num_bottles(-1), do: num_bottles(99)
  defp num_bottles(0), do: "no more bottles"
  defp num_bottles(1), do: "1 bottle"
  defp num_bottles(x), do: "#{x} bottles"

  defp action(0), do: "Go to the store and buy some more"
  defp action(1), do: "Take it down and pass it around"
  defp action(_), do: "Take one down and pass it around"
end
