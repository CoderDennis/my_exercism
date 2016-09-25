module Triangle

type TriangleKind = Equilateral | Isosceles | Scalene

let private validate sides =
    sides
    |> List.sort
    |> function
       | a :: _ when a <= 0m -> invalidOp  "sides must be greater than zero"
       | [a; b; c] when a + b <= c -> invalidOp "violates triangle inequality"
       | s -> s

let private kind' sides =
    sides
    |> Seq.distinct
    |> Seq.length
    |> function
       | 1 -> Equilateral
       | 2 -> Isosceles
       | 3 -> Scalene
       | _ -> failwith "invalid triangle"

let kind a b c =
    [a; b; c]
    |> validate
    |> kind'
