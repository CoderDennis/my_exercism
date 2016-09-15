module DifferenceOfSquares

let square x = x * x

let squareOfSums num =
    [1..num] 
    |> Seq.sum
    |> square

let sumOfSquares num = 
    [1..num]
    |> Seq.sumBy square

let difference num = 
    (squareOfSums num) - (sumOfSquares num)
