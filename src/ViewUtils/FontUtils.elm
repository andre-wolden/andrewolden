module ViewUtils.FontUtils exposing (..)

import Element exposing (Attribute)
import Element.Font exposing (size)


fontSizeXS : Float -> Attribute msg
fontSizeXS width =
    if width > 500 then
        size 12

    else
        size 14


fontSizeSmall : Float -> Attribute msg
fontSizeSmall width =
    if width > 500 then
        size 14

    else
        size 18


fontSizeMedium : Float -> Attribute msg
fontSizeMedium width =
    if width > 500 then
        size 18

    else
        size 26


fontSizeLarge : Float -> Attribute msg
fontSizeLarge width =
    if width > 500 then
        size 26

    else
        size 32


fontSizeXL : Float -> Attribute msg
fontSizeXL width =
    if width > 500 then
        size 32

    else
        size 48


fontSizeXXL : Float -> Attribute msg
fontSizeXXL width =
    if width > 500 then
        size 48

    else
        size 70
