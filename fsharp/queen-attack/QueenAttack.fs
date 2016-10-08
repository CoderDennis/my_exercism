module QueenAttack

let canAttack white ((br, bc) as black) =
    match white with
    | white when white = black -> failwith "same space"
    | (wr, _) when wr = br -> true
    | (_, wc) when wc = bc -> true
    | (wr, wc) when abs(wr-br) = abs(wc-bc) -> true
    | _ -> false