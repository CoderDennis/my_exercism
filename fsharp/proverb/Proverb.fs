module Proverb

let private items = ["nail"; "shoe"; "horse"; "rider"; "message"; "battle"; "kingdom"]

let line =
    function
    | x when x < 7 && x > -1 -> sprintf "For want of a %s the %s was lost." items.[x-1] items.[x]
    | 7 -> "And all for the want of a horseshoe nail."
    | _ -> "Invalid line number"

let proverb = 
    [1..7]
    |> Seq.map line
    |> String.concat "\n"
