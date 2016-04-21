module RNATranscription (toRNA) where

import String exposing (cons, uncons, reverse)

toRNA : String -> Result Char String
toRNA dna =
  toRNA' dna ""


toRNA' : String -> String -> Result Char String
toRNA' dna result =
  case uncons dna of
    Nothing -> Ok (reverse result)
    Just (h, t) -> case complement h of
                     Just r -> toRNA' t (cons r result)
                     Nothing -> Err h


complement : Char -> Maybe Char
complement d =
  case d of
    'G' -> Just 'C'
    'C' -> Just 'G'
    'T' -> Just 'A'
    'A' -> Just 'U'
    _   -> Nothing