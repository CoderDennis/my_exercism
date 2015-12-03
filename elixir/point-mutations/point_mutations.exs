defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance([], []), do: 0
  def hamming_distance([h|t1], [h|t2]), do: hamming_distance(t1, t2)
  def hamming_distance([_h1|t1], [_h2|t2]) do
    case hamming_distance(t1, t2) do
      nil -> nil
      val -> val + 1
    end
  end
  def hamming_distance(_, _), do: nil
end
