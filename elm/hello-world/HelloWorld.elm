module HelloWorld (..) where

helloWorld : Maybe String -> String
helloWorld name =
  "Hello, " ++ case name of
    Just name -> name ++ "!"
    Nothing -> "World!"
