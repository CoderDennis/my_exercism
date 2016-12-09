defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    all_letters = "abcdefghijklmnopqrstuvwxyz"
      |> String.codepoints
      |> MapSet.new
    sentence_letters = sentence
      |> String.downcase
      |> String.codepoints
      |> MapSet.new
    MapSet.subset?(all_letters, sentence_letters)
  end
end
