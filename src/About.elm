module About exposing (..)

import Data.DivContent exposing (aboutText, aboutTitle)
import Element exposing (Element, html, paragraph, row, text)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)


about : Element Msg
about =
    row []
        [ paragraph [] [ text aboutTitle ]
        , paragraph [] [ text aboutText ]
        , paragraph [] [ html (i [ class "fab fa-github fa-4x" ] []) ]
        , paragraph [] [ html (i [ class "fab fa-gitlab fa-4x" ] []) ]
        ]
