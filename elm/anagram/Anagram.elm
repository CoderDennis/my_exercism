module Anagram (detect) where

import String
import List

detect : String -> List String -> List String
detect word possibleAnagrams =
  let
    isAnagram = isAnagramOfWord word
  in
    List.filter isAnagram possibleAnagrams

isAnagramOfWord : String -> (String -> Bool)
isAnagramOfWord word =
  let
    loweredWord = String.toLower word
    sortedChars = sortChars word
  in
    \candidate -> loweredWord /= String.toLower candidate &&
                  sortedChars == sortChars candidate

sortChars : String -> List Char
sortChars word =
  -- Debug.log(word)
  word
    |> String.toLower
    |> String.toList
    |> List.sort
