module Accumulate

let accumulate f l =
    let rec accumulate' f l acc =
        match l with
        | [] -> acc
        | head :: tail -> accumulate' f tail (f head :: acc)
    accumulate' f l []
    |> List.rev
