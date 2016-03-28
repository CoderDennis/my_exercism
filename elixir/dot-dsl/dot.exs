defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  alias Graph, as: G

  defmacro graph(do: ast) do
    # IO.inspect(ast)
    Dot.parse(ast) |> Macro.escape
  end

  def parse(nil), do: %G{}
  def parse({:graph, _, [attrs]}), do: %G{attrs: attrs}
  def parse({:--, _, [{a, _, _}, {b, _, nil}]}), do: %G{edges: [{a, b, []}]}
  def parse({:--, _, [{a, _, _}, {b, _, [opts]}]}), do: %G{edges: [{a, b, opts}]}
  def parse({:__block__, _, items}) do
    items
    |> Enum.map(&parse/1)
    |> merge_graphs
  end
  def parse({name, _, nil}), do: %G{nodes: [{name, []}]}
  def parse({name, _, [opts]}) do
    unless Keyword.keyword?(opts) do
      raise ArgumentError, message: "Invalid Keyword: #{inspect opts}"
    end
    %G{nodes: [{name, opts}]}
  end
  def parse(x), do: raise ArgumentError, message: "Invalid Statement: #{inspect x}"

  @spec merge_graphs([G.t]) :: G.t
  defp merge_graphs(graphs) do
    Enum.reduce(graphs, fn g, acc ->
      Map.merge(g, acc, fn
        _k, v1, v1 -> v1
        _k, v1, v2 -> Enum.concat(v1, v2) |> Enum.sort()
      end)
    end)
  end
end
