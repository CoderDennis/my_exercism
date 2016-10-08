module Sieve

type Candidate =
    | Prime of int
    | Composite of int
    | Unchecked of int

let mark p range =
    range
    |> Seq.map (function
        | Unchecked i -> if i = p then Prime i elif i % p = 0 then Composite i else Unchecked i
        | c -> c)

let rec sieve (range: seq<Candidate>) =
    match (range |> Seq.tryFind (function
        | Unchecked _ -> true
        | _ -> false)) with
    | Some (Unchecked c) -> (mark c range) |> sieve
    | _ -> range

let primesUpTo limit =
    [2..limit]
    |> Seq.map (fun i -> Unchecked i)
    |> sieve
    |> Seq.map (function
        | Prime i -> i
        | _ -> 0)
    |> Seq.filter ((<) 1)
