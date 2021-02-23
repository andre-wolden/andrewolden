module About exposing (..)

import Data.DivContent exposing (aboutText, aboutTitle)
import Element exposing (Element, centerY, column, html, paddingEach, paragraph, text)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewUtils exposing (subheader)


about : Element Msg
about =
    column [ centerY, paddingEach { top = 50, right = 0, bottom = 160, left = 0 } ]
        [ subheader aboutTitle
        , paragraph [] [ text aboutText ]
        , paragraph [] [ html (i [ class "fab fa-github fa-4x" ] []), text "Github" ]
        , paragraph [] [ html (i [ class "fab fa-gitlab fa-4x" ] []), text "Gitlab" ]
        ]
