module Bob where

import String exposing (..)

hey : String -> String
hey input =
  if saysNothing input then
    "Fine. Be that way!"

  else if isShouting input then
    "Whoa, chill out!"

  else if asksQuestion input then
    "Sure."

  else
    "Whatever."

saysNothing : String -> Bool
saysNothing input =
  String.trim input == ""

isShouting : String -> Bool
isShouting input =
  String.toUpper input == input &&
  String.toLower input /= input

asksQuestion : String -> Bool
asksQuestion input =
  String.endsWith "?" input
