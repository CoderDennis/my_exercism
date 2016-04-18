module WordCount (wordCount) where

import Dict
import Regex
import String

wordCount : String -> Dict.Dict String Int
wordCount phrase =
  phrase
    |> Regex.split Regex.All (Regex.regex "[\\W]")
    |> List.filter (\w -> w /= "")
    |> List.foldl (\w dict ->
                     Dict.update (String.toLower w) (\v ->
                                      case v of
                                        Nothing -> Just 1
                                        Just x -> Just (x + 1)
                                   ) dict
                  ) Dict.empty
