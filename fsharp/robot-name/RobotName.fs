module RobotName

open System

type Robot = {name: string}

let private rnd = System.Random()

let private knuthShuffle (array: array<'a>) = 
    // from https://www.rosettacode.org/wiki/Knuth_shuffle#F.23
    // modified to return lazy seq instead of shuffling whole array up front
    let swap i j =
        //printf "swap %d %d" i j // used this to verify that swap is only called once each time nextName is called.
        let item = array.[i]
        array.[i] <- array.[j]
        array.[j] <- item
    let ln = array.Length
    [0..(ln - 2)]
    |> Seq.map (fun i ->
        swap i (rnd.Next(i, ln))
        array.[i])

let private getAllNames =
    seq { for a in 'A'..'Z' do
          for b in 'A'..'Z' do 
          for c in 0..9 do
          for d in 0..9 do
          for e in 0..9 -> sprintf "%c%c%d%d%d" a b c d e
        }
    |> Array.ofSeq
    |> knuthShuffle

let private nextName =
    let allNames = getAllNames.GetEnumerator()
    fun () -> 
        allNames.MoveNext() |> ignore
        allNames.Current |> string

let mkRobot () = 
    { name = nextName() }

let name { name = n } = n

let reset _ = mkRobot()