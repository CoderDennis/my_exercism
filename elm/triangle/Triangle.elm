module Triangle (triangleKind) where

triangleKind : number -> number -> number -> Result String String
triangleKind a b c =
  if a <= 0 || b <= 0 || c <= 0 then
    (Err "Invalid lengths")
  else if a + b <= c || b + c <= a || a + c <= b then
    (Err "Violates inequality")
  else if a == b && b == c then
    (Ok "equilateral")
  else if a == b || b == c || a == c then
    (Ok "isosceles")
  else
    (Ok "scalene")
