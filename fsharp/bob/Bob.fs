module Bob

let (|Silence|Shouting|Question|Statement|) (text: string) =
    if text.Trim() = "" then
        Silence
    else if text = text.ToUpper() && text <> text.ToLower() then 
        Shouting
    else if text.EndsWith("?") then
        Question
    else
        Statement

let hey (text) =
    match text with
    | Silence -> "Fine. Be that way!"
    | Shouting -> "Whoa, chill out!"
    | Question -> "Sure."
    | Statement -> "Whatever."