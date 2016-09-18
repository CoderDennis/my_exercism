module NucleoTideCount

let nucleotideCounts strand =
    let empty = [ ( 'A', 0 ); ( 'T', 0 ); ( 'C', 0 ); ( 'G', 0 ) ] |> Seq.ofList 
    let strandCounts = strand |> Seq.countBy(fun (n:char) -> n)
    [ empty ; strandCounts ]
    |> Seq.concat
    |> Map.ofSeq

let count nucleotide strand =
    if not (Seq.contains nucleotide "ATCG") then
        failwithf "invalid nucleotide code: %c" nucleotide
    strand
    |> Seq.filter((=) nucleotide)
    |> Seq.length