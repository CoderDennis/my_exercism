defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      input == String.upcase(input) && input != String.downcase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
