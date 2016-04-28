module Sublist (version, sublist, ListComparison(..)) where

import Trampoline exposing(trampoline, Trampoline(..))
import List

type ListComparison = Equal | Sublist | Superlist | Unequal

version : Int
version = 2

sublist : List a -> List a -> ListComparison
sublist a b =
  if trampoline (a `equals` b) then
    Equal
  else if List.isEmpty a then
    Sublist
  else if List.isEmpty b then
    Superlist
  else if a `is_sublist` b then
    Sublist
  else if b `is_sublist` a then
    Superlist
  else
    Unequal

is_sublist : List a -> List a -> Bool
is_sublist a b =
  let
    lenA = List.length a
    lenB = List.length b
  in
    if lenB < lenA then
      False
    else if trampoline (a `equals` (List.take lenA b)) then
      True
    else
      a `is_sublist` (List.drop 1 b)

equals : List a -> List a -> Trampoline Bool
equals a b =
  case (a, b) of
    ([], []) -> Done True
    ([], _) -> Done False
    (_, []) -> Done False
    (ha :: ta, hb :: tb) -> if ha /= hb then
                              Done False
                            else
                              Continue (\() -> ta `equals` tb)
  