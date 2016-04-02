module Triangle (triangleKind) where

triangleKind : number -> number -> number -> Result String String
triangleKind a b c =
  if a <= 0 || b <= 0 || c <= 0 then
    (Err "Invalid lengths")
  else if not (isLegalTriangle [a, b, c]) then
    (Err "Violates inequality")
  else if a == b && b == c then
    (Ok "equilateral")
  else if a == b || b == c || a == c then
    (Ok "isosceles")
  else
    (Ok "scalene")

isLegalTriangle : List number -> Bool
isLegalTriangle sides =
  sides
    |> List.sort
    |> List.reverse
    |> isHeadLessThanSumOfTail

isHeadLessThanSumOfTail : List number -> Bool
isHeadLessThanSumOfTail list =
  getHead list < getSumOfTail list

getHead : List number -> number
getHead list =
  list
    |> List.head
    |> Maybe.withDefault 0

getSumOfTail : List number -> number
getSumOfTail list =
  list
    |> List.tail
    |> Maybe.withDefault []
    |> List.sum
