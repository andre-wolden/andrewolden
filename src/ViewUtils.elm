module ViewUtils exposing (..)

import Element exposing (Element, column, paragraph, rgb255)
import Element.Border as Border
import Messages exposing (Msg)
import ViewTypes exposing (ViewData)


dotted : List (Element.Attribute msg)
dotted =
    [ Border.width 2, Border.solid, Border.color (rgb255 255 0 0) ]


bottomLine : List (Element.Attribute msg)
bottomLine =
    [ Border.widthEach { bottom = 2, right = 0, left = 0, top = 0 }, Border.solid, Border.color (rgb255 0 0 0) ]


dottedGreen : List (Element.Attribute msg)
dottedGreen =
    [ Border.width 2, Border.solid, Border.color (rgb255 0 255 0) ]


debugSizeValuesRow : ViewData -> Element Msg
debugSizeValuesRow viewdata =
    column []
        [ paragraph [] [ Element.text ("y = " ++ String.fromFloat viewdata.y) ]
        , paragraph [] [ Element.text ("h = " ++ String.fromFloat viewdata.h) ]
        , paragraph [] [ Element.text ("w = " ++ String.fromFloat viewdata.w) ]
        , paragraph [] [ Element.text ("hMB = " ++ String.fromFloat viewdata.hMB) ]
        ]


maximumFloat : Float -> Float -> Float
maximumFloat max value =
    if value > max then
        max

    else
        value
