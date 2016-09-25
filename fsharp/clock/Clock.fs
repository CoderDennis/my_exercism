module Clock

type Clock = { minutes: int }

let private minutesPerDay = 24 * 60

let private normalize minutes =
    ((minutes % minutesPerDay) + minutesPerDay) % minutesPerDay

let mkClock hours minutes = 
    { minutes = normalize (60 * hours + minutes) }

let display { minutes=m } =
    sprintf "%02d:%02d" (m / 60 % 24) (m % 60)

let add minutes { minutes=m } =
    { minutes = normalize (m + minutes) }

let subtract minutes clock =
    add -minutes clock
