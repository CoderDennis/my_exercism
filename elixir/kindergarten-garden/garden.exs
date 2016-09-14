defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @default_names [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @plants %{
    ?G => :grass,
    ?C => :clover,
    ?R => :radishes,
    ?V => :violets
  }

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    student_names = Enum.sort(student_names)
    empty_garden = Keyword.new(student_names, &({&1, []}))
    info_string
      |> String.split("\n")
      |> Enum.map(&(process_row(&1, student_names)))
      |> Enum.reduce(
           empty_garden,
           &merge_row_keywords/2
         )
      |> Enum.map(fn {student, seeds} -> {student, seeds_to_plants(seeds)} end)
      |> Enum.into(%{})
  end

  @spec process_row(String.t(), list) :: keyword
  defp process_row(row, student_names) do
    row
    |> String.to_char_list
    |> Enum.chunk(2)
    |> Enum.with_index
    |> Enum.map(fn {seeds, index} -> {Enum.at(student_names, index), seeds} end )
  end

  @spec merge_row_keywords(keyword, keyword) :: keyword
  defp merge_row_keywords(row, garden) do
    Keyword.merge(garden, row, fn _k, v1, v2 -> v1 ++ v2 end)
  end

  @spec seeds_to_plants(list) :: tuple
  defp seeds_to_plants(seeds) do
    seeds
    |> Enum.map(&(@plants[&1]))
    |> List.to_tuple
  end
end
