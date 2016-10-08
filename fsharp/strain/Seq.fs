module Seq

let rec private keep' pred xs acc =
    match xs with
    | [] -> acc |> Seq.rev
    | head :: tail -> match pred head with
                      | true -> keep' pred tail (head :: acc)
                      | _ -> keep' pred tail acc 
    
let keep pred xs = 
    keep' pred (xs |> List.ofSeq) []

let discard pred =
    keep (not << pred)
