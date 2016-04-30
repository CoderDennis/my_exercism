module NucleotideCount (nucleotideCounts, version) where

nucleotideCounts : String -> List
nucleotideCounts s =
  { a = 0, t = 0, c = 0, g = 0 }

version : Int
version =
  2
