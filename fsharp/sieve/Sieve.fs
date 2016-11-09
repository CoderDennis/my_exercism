module Sieve

type Candidate =
    | Unmarked of int
    | Marked of int

let private mark prime range =
    range 
    |> List.map (
        function
        | Unmarked i when i % prime = 0 -> Marked i
        | c -> c)

let rec private sieve marked =
    function
    | [] -> marked |> Seq.rev
    | ((Unmarked p) as pp) :: tail -> sieve (pp :: marked) (mark p tail)
    | c :: tail -> sieve (c :: marked) tail 

let primesUpTo limit =
    [2..limit]
    |> List.map Unmarked
    |> sieve []
    |> Seq.map (
        function
        | Unmarked i -> i
        | _ -> 0)
    |> Seq.filter ((<) 1)
