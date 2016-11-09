module PerfectNumbers

type Classification = Deficient | Perfect | Abundant

let factors num =
    [1..num/2]
    |> Seq.filter (fun f -> num % f = 0)

let aliquotSum num =
    num
    |> factors
    |> Seq.sum

let classify num =
    match (num |> aliquotSum) with
    | sum when sum < num -> Deficient
    | sum when sum = num -> Perfect
    | _ -> Abundant