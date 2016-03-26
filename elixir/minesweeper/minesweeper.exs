defmodule Minesweeper do
  alias Minesweeper.Square, as: Sq

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]
  def annotate([]), do: []
  def annotate(board) do
    board
    |> Enum.with_index()
    |> Enum.flat_map(&parse_line/1)
    |> Enum.into(%{})
    |> increment_neighbor_values()
    |> display_board()
  end

  @spec parse_line({String.t, Integer}) :: [Sq.t]
  defp parse_line({line, row}) do
    line
    |> String.codepoints()
    |> Enum.with_index()
    |> Enum.flat_map(fn {v, col} ->
      {:ok, pid} = Sq.start_link(v)
      %{{row, col} => pid}
    end)
  end

  defp increment_neighbor_values(board_map) do
    board_map
    |> Enum.filter(fn {_, sq} -> Sq.read(sq) == "*" end)
    |> Enum.each(fn {{row, col}, _} ->
                   for r <- row-1..row+1,
                       c <- col-1..col+1,
                       {r, c} != {row, col} do
                         # IO.inspect({r, c})
                         case Map.fetch(board_map, {r,c}) do
                           {:ok, sq} -> Sq.increment(sq)
                           :error -> nil
                         end
                       end
                 end)
    board_map
  end

  defp display_board(board_map) do
    board_map
    |> Enum.chunk_by(fn {{r, _}, _} -> r end)
    |> Enum.map(&(Enum.map(&1, fn {_, sq} -> Sq.read(sq) end)))
    |> Enum.map(&Enum.join/1)
  end
end

defmodule Minesweeper.Square do
  use GenServer
  alias __MODULE__, as: Sq
  defstruct value: nil

  def start_link( v ) when is_integer(v) do
    GenServer.start_link(__MODULE__, [%Sq{value: v}])
  end
  def start_link("*"), do: start_link(-1)
  def start_link(" "), do: start_link( 0)
  def start_link( v ), do: start_link(String.to_integer(v))

  def init([sq]) do
    {:ok, sq}
  end

  def increment(square) do
    GenServer.cast(square, :increment)
  end

  def read(square) do
    GenServer.call(square, :read)
  end

  def handle_cast(_, %Sq{value: -1} = sq), do: {:noreply, sq}
  def handle_cast(:increment, %Sq{value: v} = sq) do
    {:noreply, %{sq | value: v + 1}}
  end

  def handle_call(:read, _from, sq) do
    {:reply, to_string(sq), sq}
  end

end

defimpl String.Chars, for: Minesweeper.Square do
  alias Minesweeper.Square, as: Sq
  def to_string(sq, _opts), do: __MODULE__.to_string(sq)
  def to_string(%Sq{value: -1}), do: "*"
  def to_string(%Sq{value:  0}), do: " "
  def to_string(sq), do: "#{sq.value}"
end
