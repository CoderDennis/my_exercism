module SumOfMultiples (sumOfMultiples) where

import List

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples num =
  let
    isMultiple n =
      List.any (\m -> n % m == 0) multiples
  in
    [1..num-1]
      |> List.filter isMultiple
      |> List.sum
