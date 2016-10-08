module Isogram

open System

let isogram (str: string) =
    let letters = 
        str.ToLower() 
        |> Seq.filter Char.IsLetter
    let letterCount = 
        letters 
        |> Seq.length
    let distinctLetterCount = 
        letters
        |> Seq.distinct
        |> Seq.length
    letterCount = distinctLetterCount
