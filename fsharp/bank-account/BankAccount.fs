module BankAccount

type Account = 
    | Open of float
    | Closed

let mkBankAccount() = Closed

let openAccount account = Open 0.0

let getBalance =
    function
    | Open amount -> Some amount
    | Closed -> None

let updateBalance amount =
    function
    | Open balance -> Open (balance + amount)
    | Closed -> Closed

let closeAccount account = Closed
