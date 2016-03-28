defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(do: block) do
    # IO.inspect(block)
    quote bind_quoted: [
      block: Macro.escape(block, unquote: false)
    ] do
      Dot.parse(block)
    end
  end

  def parse(nil), do: %Graph{}
  def parse({:graph, _, [attrs]}), do: %Graph{attrs: attrs}
  def parse({:--, _, [{a, _, _}, {b, _, nil}]}) do
    %Graph{edges: [{a, b, []}]}
  end
  def parse({:--, _, [{a, _, _}, {b, _, [opts]}]}) do
    %Graph{edges: [{a, b, opts}]}
  end
  def parse({:__block__, _, items}) do
    items
    |> Enum.map(&parse/1)
    |> Enum.reduce(fn g, acc ->
      Map.merge(g, acc, fn
        :__struct__, v1, _v2 -> v1
        _k, v1, v2 -> Enum.concat(v1, v2) |> Enum.sort()
      end)
    end)
  end
  def parse({name, _, nil}), do: %Graph{nodes: [{name, []}]}
  def parse({name, _, [opts]}) do
    unless Keyword.keyword?(opts) do
      raise ArgumentError
    end
    %Graph{nodes: [{name, opts}]}
  end
  def parse(_), do: raise ArgumentError
end
