defmodule Frequency do
  use GenServer
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Dict.t
  def frequency(texts, workers) do
    text_count = Enum.count(texts)
    workers = min(text_count, workers)
    agents = for a <- 1..workers do
      GenServer.start_link(Worker, %{})
    end
    texts
    |> Enum.chunk(text_count / workers)
    |> Enum.with_index

  end

end

defmodule Worker do
  use GenServer


end
