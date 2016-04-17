module DifferenceOfSquares (squareOfSum, sumOfSquares, difference) where

squareOfSum : number -> number
squareOfSum n =
  let
    sum n acc =
      case n of
        0 -> acc
        x -> sum (n-1) (x + acc)
  in
    (sum n 0)^2


sumOfSquares : number -> number
sumOfSquares n =
  let
    sumOfSquares n acc =
      case n of
        0 -> acc
        x -> sumOfSquares (n-1) (x^2 + acc)
  in
    sumOfSquares n 0


difference : number -> number
difference n =
  (squareOfSum n) - (sumOfSquares n)

