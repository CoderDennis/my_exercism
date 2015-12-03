defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    case do_compare_left(a, b) do
      :unequal -> case do_compare_left(b, a) do
                    :sublist -> :superlist
                    result -> result
                  end
      result   -> result
    end
  end

  defp do_compare_left(x, x),  do: :equal
  defp do_compare_left([], _), do: :sublist
  defp do_compare_left(_, []), do: :superlist
  defp do_compare_left([a], [b]) when a != b, do: :unequal
  defp do_compare_left([head|tail_a] = a, [head|tail_b]) do
    case left_side_match(tail_a, tail_b) do
      :unequal -> case do_compare_left(a, tail_b) do
                    :equal -> :sublist
                    result -> result
                  end
      result -> result
    end
  end
  defp do_compare_left(a, [_h|t]) do
    case do_compare_left(a, t) do
      :equal     -> :sublist
      :superlist -> :unequal
      result     -> result
    end
  end

  defp left_side_match([], []), do: :equal
  defp left_side_match([], _),  do: :sublist
  defp left_side_match([head|tail_a], [head|tail_b]) do
    left_side_match(tail_a, tail_b)
  end
  defp left_side_match(_, _), do: :unequal

end
