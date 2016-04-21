module Hamming (distance) where

import String exposing (toList)

distance : String -> String -> Maybe Int
distance strandA strandB =
  let
    distance' listA listB count =
      case (listA, listB) of
        ( a :: tailA, b :: tailB ) -> 
          if a == b then
            distance' tailA tailB count
          else
            distance' tailA tailB (count + 1)           
        ([], []) -> Just count
        (_, _) -> Nothing
  in
    distance' (toList strandA) (toList strandB) 0 
