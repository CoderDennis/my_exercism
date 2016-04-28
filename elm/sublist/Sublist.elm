module Sublist (version, sublist, ListComparison(..)) where

import List exposing (isEmpty, length, take, drop)

type ListComparison = Equal | Sublist | Superlist | Unequal

version : Int
version = 2

sublist : List a -> List a -> ListComparison
sublist a b =
  if a `equals` b then
    Equal
  else if isEmpty a then
    Sublist
  else if isEmpty b then
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
    lenA = length a
  in
    if (length b) < lenA then
      False
    else if a `equals` (take lenA b) then
      True
    else
      a `is_sublist` (drop 1 b)

equals : List a -> List a -> Bool
equals a b =
  case (a, b) of
    ([], []) -> True
    (ha :: ta, hb :: tb) -> if ha /= hb then
                              False
                            else
                              ta `equals` tb
    _ -> False
