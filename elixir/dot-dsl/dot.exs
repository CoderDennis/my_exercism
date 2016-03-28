defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(do: block) do
    nodes = parse(block)
    quote do
      %Graph{nodes: unquote(nodes)}
    end
  end

  def parse(nil), do: []
  def parse({name, _, _}) do
    [{name, []}]
  end
end
