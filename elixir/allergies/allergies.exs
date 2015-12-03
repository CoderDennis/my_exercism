defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    do_list(<<flags>>)
    |> Enum.reject(fn {_, x} -> x == 0 end)
    |> Enum.map(fn {val, _} -> val end)
  end

  defp do_list(<<cats :: size(1),
                 pollen :: size(1),
                 chocolate :: size(1),
                 tomatoes :: size(1),
                 strawberries :: size(1),
                 shellfish :: size(1),
                 peanuts :: size(1),
                 eggs :: size(1)>>) do
    [{"eggs", eggs},
     {"peanuts", peanuts},
     {"shellfish", shellfish},
     {"strawberries", strawberries},
     {"tomatoes", tomatoes},
     {"chocolate", chocolate},
     {"pollen", pollen},
     {"cats", cats}]
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    item in list(flags)
  end
end
