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
    check_brackets(String.graphemes(str), [])
  end

  # base cases
  defp check_brackets([], []) do
    true
  end
  defp check_brackets([], _) do
    false
  end
  # when finding an open bracket, add match to expected_closings
  defp check_brackets([open | rest], expected_closings) when open in @openings do
    check_brackets(rest, [Map.get(@brackets, open)] ++ expected_closings)
  end
  # when finding an expected closing bracket, remove it from expected_closings
  defp check_brackets([close | rest], [close | expected_closings]) do
    check_brackets(rest, expected_closings)
  end
  # when finding an unexpected closing bracket, return false
  defp check_brackets([close | _], _) when close in @closings do
    false
  end
  # ignore non bracket characters
  defp check_brackets([_ | rest], expected_closings) do
    check_brackets(rest, expected_closings)
  end
end
