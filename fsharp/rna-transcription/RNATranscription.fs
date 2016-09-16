module RNATranscription

let transcribe n =
    match n with
    | 'G' -> 'C'
    | 'C' -> 'G'
    | 'T' -> 'A'
    | 'A' -> 'U'
    | _ -> ' '

let toRna dna = 
    dna
    |> Seq.map transcribe