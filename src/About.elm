module About exposing (..)

import Data.DivContent exposing (aboutText, aboutTitle)
import Debug exposing (todo)
import Element exposing (Element, centerX, column, el, explain, fill, html, newTabLink, padding, paragraph, row, spacing, text, width)
import Element.Font exposing (underline)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewUtils.ViewUtils exposing (centeredSectionHeader)


about : Element Msg
about =
    column [ width fill ]
        [ centeredSectionHeader aboutTitle
        , paragraph [ spacing 6, padding 24 ] [ text aboutText ]
        , row [ padding 24, spacing 16 ]
            [ el [] (html (i [ class "fab fa-github fa-2x" ] []))
            , el [] (newTabLink [] { url = "https://github.com/woldena", label = el [ underline ] (text "Github") })
            ]
        , row [ padding 24, spacing 16 ]
            [ el [] (html (i [ class "fab fa-gitlab fa-2x" ] []))
            , el [] (newTabLink [] { url = "https://gitlab.com/wolden.andre", label = el [ underline ] (text "Gitlab") })
            ]
        ]
