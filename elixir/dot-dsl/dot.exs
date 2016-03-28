defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(do: block) do
    IO.inspect(block)
    quote bind_quoted: [
      block: Macro.escape(block, unquote: false)
    ] do
      Dot.parse(block)
    end
  end

  def parse(nil), do: %Graph{}
  def parse({:graph, _, [attrs]}), do: %Graph{attrs: attrs}
  def parse({:--, _, [{a, _, _}, {b, _, _}]}), do: %Graph{edges: [{a, b, []}]}
  def parse({name, _, nil}), do: %Graph{nodes: [{name, []}]}
  def parse({name, _, [opts]}), do: %Graph{nodes: [{name, opts}]}
end
