defmodule BracketPush do
  @brackets %{
    "{" => "}",
    "[" => "]",
    "(" => ")",
  }
  @openings Map.keys(@brackets)
  @closings Map.values(@brackets)

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes
    |> check_brackets([])
  end

  # base cases
  defp check_brackets([], []), do: true
  defp check_brackets([], _), do: false
  # when finding an open bracket, push match onto expected_closings_stack
  defp check_brackets([open | rest], expected_closings_stack) when open in @openings do
    check_brackets(rest, [Map.get(@brackets, open)] ++ expected_closings_stack)
  end
  # when finding an expected closing bracket, pop it from expected_closings_stack
  defp check_brackets([close | rest], [close | expected_closings_stack]) do
    check_brackets(rest, expected_closings_stack)
  end
  # when finding an unexpected closing bracket, return false
  defp check_brackets([close | _], _) when close in @closings do
    false
  end
  # ignore non bracket characters
  defp check_brackets([_ | rest], expected_closings_stack) do
    check_brackets(rest, expected_closings_stack)
  end
end
