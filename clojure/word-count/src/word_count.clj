(ns word-count (:require [clojure.string :as s]))

(defn- put-word-into-map [existing-map word]
  (merge-with + existing-map {word 1}))

(defn word-count [words]
  (->>
    words
    s/lower-case
    (#(s/split % #"\W+"))
    reduce put-word-into-map {}))
