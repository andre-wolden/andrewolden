module ViewConstants exposing (wContent, wContentMax)


wContentMax : Float
wContentMax =
    1000


wContent : Float -> Float
wContent wScene =
    if wScene <= wContentMax then
        wScene

    else
        wContentMax
