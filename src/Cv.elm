module Cv exposing (..)

import Element exposing (Element, el, fill, height, padding, paddingEach, px, rgb, row, spacing, text, textColumn, width)
import Element.Background exposing (color)
import Element.Border exposing (rounded)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader)


circle : Element Msg
circle =
    el [ color (rgb 0.37 0.67 0.86), rounded 10, width (px 20), height (px 20) ] (text " ")


cv : Element Msg
cv =
    textColumn [ width fill, paddingEach { top = 0, right = 0, bottom = 180, left = 0 } ]
        [ centeredSectionHeader "CV"
        , row [ padding 18, spacing 18 ] [ circle, text "January 2018 - now" ]
        , row [ padding 18, spacing 18 ] [ circle, text "August 2012 - December 2017" ]
        ]
