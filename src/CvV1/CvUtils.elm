module CvV1.CvUtils exposing (..)

import Element exposing (Element, el, height, padding, paddingEach, paragraph, px, rgb, row, spacing, text, width)
import Element.Background exposing (color)
import Element.Border exposing (rounded)
import Messages exposing (Msg)
import ViewUtils.FontUtils exposing (fontSizeMedium, fontSizeSmall, fontSizeXS)
import ViewUtils.Palette exposing (pOneOrange)
import ViewUtils.ViewUtils exposing (edges)


circle : Element Msg
circle =
    el [ color pOneOrange, rounded 10, width (px 20), height (px 20) ] (text " ")


workDateHeader : String -> Float -> Element Msg
workDateHeader string screenWidth =
    row [ padding 18, spacing 18, fontSizeMedium screenWidth ] [ circle, text string ]


infoDescription : String -> Float -> Element Msg
infoDescription string screenWidth =
    paragraph [ paddingEach { edges | top = 30 }, fontSizeXS screenWidth ] [ text string ]
