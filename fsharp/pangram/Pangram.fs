module Pangram

let isPangram (input: string) =
    let allASCIIletters = ['a'..'z'] |> Set.ofList 
    input.ToLower()
    |> Set.ofSeq
    |> Set.isSubset allASCIIletters
