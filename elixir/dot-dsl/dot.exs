defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(do: block) do
    x = Macro.to_string(block)
    quote do
      %Graph{nodes: Dot.node(unquote(x))}
    end
  end

  def node("nil"), do: []
  def node(name) do
    [{String.to_atom(name), []}]
  end
end
