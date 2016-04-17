module Strain (keep, discard) where

keep : (a -> Bool) -> List a -> List a
keep fun list =
  case list of
    [] -> []
    first :: rest ->
      if fun first then
        first :: keep fun rest
      else
        keep fun rest

discard : (a -> Bool) -> List a -> List a
discard fun list =
  keep (\n -> not (fun n)) list