module GradeSchool

type School = Map<int, Set<string>>

let empty : School = Map.empty

let roster (school: School) =
    school
    |> Map.toSeq
    |> Seq.map(fun (grade, students) -> (grade, students |> Set.toList))

let add student grade (school: School) =
    match Map.tryFind grade school with
    | Some students -> school |> Map.add grade (students |> Set.add student)
    | None -> school |> Map.add grade ([student] |> Set.ofList)

let grade number (school: School) = 
    match Map.tryFind number school with
    | Some students -> students |> Set.toList
    | None -> []
