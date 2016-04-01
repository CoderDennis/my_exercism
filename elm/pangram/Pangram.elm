module Pangram where

import String
import Set

allLetters =
  "abcdefghijklmnopqrstuvwxyz"

isPangram : String -> Bool
isPangram sentence =
  sentence
    |> String.toLower
    |> String.toList
    |> Set.fromList
    |> Set.toList
    |> String.fromList
    |> String.contains allLetters
