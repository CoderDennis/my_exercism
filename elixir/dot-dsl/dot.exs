defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(do: block) do
    IO.inspect(block)
    {attrs, nodes, edges} = parse(block)
    quote do
      %Graph{attrs: unquote(attrs), nodes: unquote(nodes), edges: unquote(edges)}
    end
  end

  def parse(nil), do: {[], [], []}
  def parse({:graph, _, [attrs]}), do: {attrs, [], []}
  # def parse({:--, _, [{a, _, _}, {b, _, _}]}), do: {[], [], [a, b, []]}
  def parse({name, _, nil}), do: {[], [{name, []}], []}
  def parse({name, _, [opts]}), do: {[], [{name, opts}], []}
end
