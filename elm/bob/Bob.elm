module Bob where

import String exposing (..)

hey : String -> String
hey input =
  if String.trim input == "" then
    "Fine. Be that way!"

  else if String.toUpper input == input &&
          String.toLower input /= input then
    "Whoa, chill out!"

  else if String.endsWith "?" input then
    "Sure."

  else
    "Whatever."
