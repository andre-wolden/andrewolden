module ViewConstants exposing (..)


wContentMax : Float
wContentMax =
    1000


wContent : Float -> Float
wContent wScene =
    if wScene <= wContentMax then
        wScene

    else
        wContentMax


cWMax : Float
cWMax =
    1024


cHMax : Float
cHMax =
    1024


cMBMin : Float
cMBMin =
    80


cMBMinDelta : Float
cMBMinDelta =
    40


picturePercentage : Float
picturePercentage =
    80
