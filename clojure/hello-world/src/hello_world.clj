(ns hello-world)

(defn hello 
  ([]
    "Hello, World!"
  )
  ([name] ;; <- arglist goes here
    (str "Hello, " name "!") ;; your code goes here
  )
)
