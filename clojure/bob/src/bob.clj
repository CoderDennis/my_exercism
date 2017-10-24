(ns bob
  (:require [clojure.string :as str]))

(defn yelling? [input]
  (and (= (str/upper-case input) input)
       (not= (str/lower-case input) input)))

(defn response-for [input] ;; <- arglist goes here
  (cond 
    (yelling? input) "Whoa, chill out!" 
    (str/ends-with? input "?") "Sure." 
    (str/blank? input) "Fine. Be that way!"
    :else "Whatever."))

