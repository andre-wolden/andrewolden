module About exposing (..)

import Data.DivContent exposing (aboutText, aboutTitle)
import Element exposing (Element, centerX, centerY, column, el, fill, height, html, paddingEach, paddingXY, paragraph, px, row, text, width)
import Element.Font exposing (size)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)


about : Element Msg
about =
    column [ centerY, paddingEach { top = 0, right = 0, bottom = 160, left = 0 } ]
        [ el [ size 24, centerX, paddingEach { top = 0, right = 0, bottom = 24, left = 0 } ] (text aboutTitle)
        , paragraph [] [ text aboutText ]
        , paragraph [] [ html (i [ class "fab fa-github fa-4x" ] []), text "Github" ]
        , paragraph [] [ html (i [ class "fab fa-gitlab fa-4x" ] []), text "Gitlab" ]
        ]
