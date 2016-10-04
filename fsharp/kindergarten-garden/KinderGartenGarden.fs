module KinderGartenGarden

type Plant = Grass | Clover | Radishes | Violets

type Garden =  Map<string, seq<Plant>>

let private seedsToPlants seeds =
    seeds
    |> Seq.map (function
        | 'G' -> Grass
        | 'C' -> Clover
        | 'R' -> Radishes
        | 'V' -> Violets
        | _ -> failwith "unknown")

let private groupSeeds (rows: string) =
    let chunks = (rows.Split '\n'
                  |> Array.map (Seq.chunkBySize 2))
    Seq.zip chunks.[0] chunks.[1]
    |> Seq.map (fun (a, b) -> Array.append a b)

let garden students rows : Garden =
    let sortedStudents = students |> List.sort
    rows
    |> groupSeeds
    |> Seq.mapi (fun i seeds -> (sortedStudents.[i], (seedsToPlants seeds)))
    |> Map.ofSeq

let defaultGarden rows =
    garden ["Alice"; "Bob"; "Charlie"; "David"; "Eve"; "Fred"; "Ginny"; "Harriet"; "Ileana"; "Joseph"; "Kincaid"; "Larry"] rows

let lookupPlants student (garden: Garden) = 
    match Map.containsKey student garden with
    | true -> garden.[student]
    | false -> Seq.empty
