module ErrorHandling

open System

let handleErrorByThrowingException () =
    failwith "Foo!"

let handleErrorByReturningOption =
    function
    | "1" -> Some 1
    | _ -> None

type Result =
    | Ok of int
    | Error of string

let handleErrorByReturningResult =
    function
    | "1" -> Ok 1
    | _ -> Error "Could not convert input to integer"

let bind f =
    function
    | Ok x -> f x
    | Error e -> Error e

let cleanupDisposablesWhenThrowingException (r:IDisposable) =
    try
        failwith "Foo!"
    finally
        r.Dispose()
