module Accumulate

let rec accumulate f l =
    match l with
    | head :: tail -> f head :: accumulate f tail
    | [] -> []