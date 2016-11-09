module PhoneNumber

open System

let parsePhoneNumber str =
    let digits = (str 
        |> Seq.filter Char.IsDigit
        |> List.ofSeq)
    match (digits.Length, digits) with
    | 10, d
    | 11, '1' :: d -> Some (d |> String.Concat)
    | _ -> None
