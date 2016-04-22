module RunLengthEncoding (version, decode, encode) where

import Regex exposing (replace, regex)
import String exposing (repeat, toInt, uncons, fromChar, startsWith)

version : Int
version = 2

decode : String -> String
decode input =
  replace Regex.All (regex "(\\d+)(.)") expandRun input

expandRun : Regex.Match -> String
expandRun {submatches} =
  case submatches of
    [Just count, Just value] -> repeat (countToInt count) value
    _ -> ""

countToInt : String -> Int
countToInt str =
  case toInt str of
    Ok val -> val
    _ -> 0

encode : String -> String
encode input =
  encode' input 1

encode' : String -> Int -> String
encode' input count =
  case uncons input of
    Nothing -> ""
    Just (head, tail) -> 
      let
        firstLetter = fromChar head
      in
        if startsWith firstLetter tail then
          encode' tail (count + 1)
        else
          (countToString count) ++ firstLetter ++ (encode' tail 1)

countToString : Int -> String
countToString count =
  if count == 1 then
    ""
  else
    toString count