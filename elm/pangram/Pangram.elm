module Pangram where

import String exposing (toLower, toList, fromList, contains)
import Set exposing (fromList, toList)

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
