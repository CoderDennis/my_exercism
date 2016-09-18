module Raindrops

let private ifEmpty number str =
    match str with
    | "" -> string number
    | _ -> str

let convert number = 
    [(3, "Pling"); (5, "Plang"); (7, "Plong")]
    |> List.filter (fun (factor, _) -> number % factor = 0)
    |> List.map snd
    |> List.fold (+) ""
    |> ifEmpty number
