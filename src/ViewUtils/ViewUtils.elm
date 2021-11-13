module ViewUtils.ViewUtils exposing (..)

import Element exposing (Attribute, Element, centerX, column, paddingEach, paragraph, rgb255, row, text, textColumn)
import Element.Border as Border
import Element.Font exposing (center, size)
import Messages exposing (Msg)
import ViewUtils.FontUtils exposing (fontSizeLarge)
import ViewUtils.ViewTypes exposing (ViewData)


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


centeredSectionHeader : String -> Element Msg
centeredSectionHeader string =
    paragraph
        [ size 36
        , center
        , paddingEach { top = 0, right = 0, bottom = 60, left = 0 }
        ]
        [ text string ]


header1 : String -> Element Msg
header1 string =
    paragraph [ size 28, paddingEach { top = 0, right = 0, bottom = 20, left = 0 } ] [ text string ]


header2 : String -> Element Msg
header2 string =
    paragraph [ size 24, paddingEach { top = 0, right = 0, bottom = 20, left = 0 } ] [ text string ]


header3 : String -> Float -> Element Msg
header3 string screenWidth =
    paragraph [ fontSizeLarge screenWidth, paddingEach { top = 0, right = 0, bottom = 20, left = 0 } ] [ text string ]


paddedTextRow : List (Element msg) -> Element msg
paddedTextRow list =
    row [ paddingEach { top = 0, right = 0, bottom = 30, left = 0 } ] list


paddedHeaderRow : List (Element msg) -> Element msg
paddedHeaderRow list =
    textColumn [ paddingEach { top = 100, right = 0, bottom = 50, left = 0 }, centerX ] list


edges : { top : Int, right : Int, bottom : Int, left : Int }
edges =
    { top = 0, right = 0, bottom = 0, left = 0 }
