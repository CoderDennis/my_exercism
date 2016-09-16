module SpaceAge

type Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune

let rec spaceAge planet seconds = 
    let earthAge = seconds / 31557600m
    let age = 
        match planet with
        | Earth   -> earthAge 
        | Mercury -> earthAge / 0.2408467m
        | Venus   -> earthAge / 0.61519726m
        | Mars    -> earthAge / 1.8808158m
        | Jupiter -> earthAge / 11.862615m
        | Saturn  -> earthAge / 29.447498m
        | Uranus  -> earthAge / 84.016846m
        | Neptune -> earthAge / 164.79132m
    System.Math.Round(age, 2)
