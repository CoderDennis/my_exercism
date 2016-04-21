module RNATranscription (toRNA) where

import String exposing (toList, fromList)
import List exposing (reverse)

toRNA : String -> Result Char String
toRNA dna =
  toRNA' (toList dna) []


toRNA' : List Char -> List Char -> Result Char String
toRNA' dna result =
  case dna of
    [] -> Ok (result |> reverse |> fromList)
    h :: t -> case complement h of
                Just r -> toRNA' t (r :: result)
                Nothing -> Err h


complement : Char -> Maybe Char
complement d =
  case d of
    'G' -> Just 'C'
    'C' -> Just 'G'
    'T' -> Just 'A'
    'A' -> Just 'U'
    _   -> Nothing