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
        size 16


fontSizeMedium : Float -> Attribute msg
fontSizeMedium width =
    if width > 500 then
        size 16

    else
        size 18


fontSizeLarge : Float -> Attribute msg
fontSizeLarge width =
    if width > 500 then
        size 18

    else
        size 22


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
