module Accumulate (..) where

accumulate : (a -> a) -> List a -> List a
accumulate fun list =
  case list of
    [] -> []

    first :: rest ->
      fun first :: accumulate fun rest
