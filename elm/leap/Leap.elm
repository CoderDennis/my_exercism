module Leap (..) where

isLeapYear year =
  isFourthYear year &&
    isNotCentury year ||
      isFourthCentury year

isFourthYear year =
  year `rem` 4 == 0

isNotCentury year =
  year `rem` 100 /= 0

isFourthCentury year =
  year `rem` 400 == 0
