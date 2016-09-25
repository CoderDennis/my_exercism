module ETL

let transform (old: Map<int, string list>) =
    old
    |> Map.toSeq
    |> Seq.collect (fun (score, letters) -> 
        letters 
        |> Seq.map (fun l -> (l.ToLower(), score)))
    |> Map.ofSeq