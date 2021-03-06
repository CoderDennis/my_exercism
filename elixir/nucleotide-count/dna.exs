defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, &(nucleotide == &1))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    dict = for n <- @nucleotides, into: %{}, do: {n, 0}
    nucleotide_counts(strand, dict)
  end
  defp nucleotide_counts([], dict), do: dict
  defp nucleotide_counts([h|t], dict) do
    nucleotide_counts(t, Dict.update!(dict, h, &(&1+1)))
  end

end
