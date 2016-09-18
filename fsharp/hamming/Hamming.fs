module Hamming

let compute strand1 strand2 = 
    Seq.zip strand1 strand2
    |> Seq.filter(fun (x, y) -> x <> y)
    |> Seq.length 
