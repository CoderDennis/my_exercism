module SumOfMultiples (sumOfMultiples) where

import List

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples num =
  let
    isMultiple n =
      multiples
        |> List.any (divides n)
  in
    [1..num-1]
      |> List.filter isMultiple
      |> List.sum

divides : Int -> Int -> Bool
divides dividend divisor =
  dividend % divisor == 0
