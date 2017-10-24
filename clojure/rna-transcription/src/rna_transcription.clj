(ns rna-transcription)

(def dna-to-rna 
  {\G \C
   \C \G
   \T \A
   \A \U})

(defn to-rna [dna] ;; <- arglist goes here
  (let [result (apply str (map dna-to-rna dna))]
  (if (= nil (assert result))
    result)))
