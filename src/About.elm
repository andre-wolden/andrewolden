module About exposing (..)

import Data.DivContent exposing (aboutText, aboutTitle)
import Element exposing (Element, el, html, newTabLink, padding, paragraph, row, spacing, text)
import Element.Font exposing (underline)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader, fullWidthSection)


about : Element Msg
about =
    fullWidthSection
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
