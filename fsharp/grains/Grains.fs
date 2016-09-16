module Grains

let rec square n =
    match n with
    | 1 -> 1I
    | n -> 2I * (square (n - 1))

let total =
    {1..64}
    |> Seq.sumBy(square)