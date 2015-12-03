defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    rna_map = %{?G => ?C,
                ?C => ?G,
                ?T => ?A,
                ?A => ?U}
    dna
    |> Enum.map(&(rna_map[&1]))
  end

end
