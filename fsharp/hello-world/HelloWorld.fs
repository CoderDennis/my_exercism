module HelloWorld

let hello (name) = 
    match name with
    | None -> "Hello, World!"
    | Some name -> sprintf "Hello, %s!" name