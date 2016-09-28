module ProteinTranslation

open System

let private toCodons (rna: string) =
    rna
    |> Seq.chunkBySize 3
    |> Seq.map String.Concat

let private toProtein =
    function
    | "AUG"                         -> "Methionine"
    | "UUU" | "UUC"                 -> "Phenylalanine"
    | "UUA" | "UUG"                 -> "Leucine"
    | "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
    | "UAU" | "UAC"                 -> "Tyrosine"
    | "UGU" | "UGC"                 -> "Cysteine"
    | "UGG"                         -> "Tryptophan"
    | "UAA" | "UAG" | "UGA"         -> "STOP"
    | _ -> failwith "unknown"

let translate rna =
    rna
    |> toCodons
    |> Seq.map toProtein
    |> Seq.takeWhile ((<>) "STOP")
