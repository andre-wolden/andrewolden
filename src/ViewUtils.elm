module ViewUtils exposing (..)

import Debug exposing (todo)
import Element exposing (Element, centerX, column, el, explain, paddingEach, paragraph, rgb255, row, text, width)
import Element.Border as Border
import Element.Font exposing (size)
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


subheader : String -> Element Msg
subheader string =
    el [ size 24, centerX ] (text string)


header3 : String -> Element Msg
header3 string =
    el [ size 20 ] (text string)


paddedTextRow : List (Element msg) -> Element msg
paddedTextRow list =
    row [ paddingEach { top = 0, right = 0, bottom = 30, left = 0 }, explain todo ] list


paddedHeaderRow : List (Element msg) -> Element msg
paddedHeaderRow list =
    row [ paddingEach { top = 100, right = 0, bottom = 50, left = 0 }, centerX ] list
