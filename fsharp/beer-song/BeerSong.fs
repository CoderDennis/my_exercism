module BeerSong

let private bottles =
    function
    | -1 -> "99 bottles"
    | 0 -> "No more bottles"
    | 1 -> "1 bottle"
    | x -> sprintf "%d bottles" x

let private pronoun =
    function
    | 1 -> "it"
    | x -> "one"

let private action =
    function
    | 0 -> "Go to the store and buy some more"
    | x -> sprintf "Take %s down and pass it around" (pronoun x)

let verse num = 
    let b = bottles num
    sprintf "%s of beer on the wall, %s of beer.\n%s, %s of beer on the wall.\n" b (b.ToLower()) (action num) ((bottles (num-1)).ToLower())

let verses x y =
    [x .. -1 .. y]
    |> Seq.map(verse)
    |> Seq.fold (sprintf "%s%s\n") ""

let sing =
    verses 99 0