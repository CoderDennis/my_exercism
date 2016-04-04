module Anagram (detect) where

import String
import List

detect : String -> List String -> List String
detect word possibleAnagrams =
  let
    wordLower =
      String.toLower word
    wordChars =
      sortChars wordLower
  in
    List.filter (isAnagram wordLower wordChars) possibleAnagrams

isAnagram word chars anagram =
  let
    anagram' =
      String.toLower anagram
  in
     word /= anagram' &&
    chars == sortChars anagram'

sortChars word =
  word
    |> String.toList
    |> List.sort
