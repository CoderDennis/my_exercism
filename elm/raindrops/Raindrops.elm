module Raindrops (raindrops) where

raindrops : Int -> String
raindrops num =
  case pling num ++ plang num ++ plong num of
    "" -> (toString num)
    x  -> x

pling : Int -> String
pling num =
  drop num 3 "Pling"

plang : Int -> String
plang num =
  drop num 5 "Plang"

plong : Int -> String
plong num =
  drop num 7 "Plong"

drop : Int -> Int -> String -> String
drop num factor string =
  if num % factor == 0 then
    string
  else
    ""
