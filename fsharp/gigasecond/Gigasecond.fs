module Gigasecond

open System

let gigasecond (date : DateTime) =
    date.AddSeconds(10.**9.).Date