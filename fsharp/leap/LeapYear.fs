module LeapYear

let isDivisibleBy x y =
    x % y = 0

let isDivisibleByFour year =
    isDivisibleBy year 4

let isNotDivisibleBy100 year =
    not (isDivisibleBy year 100)

let isDivisibleBy400 year =
    isDivisibleBy year 400

let isLeapYear year = 
    isDivisibleByFour year && (isNotDivisibleBy100 year || isDivisibleBy400 year)
