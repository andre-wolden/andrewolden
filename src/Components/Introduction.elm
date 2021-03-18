module Components.Introduction exposing (introductionSection)

import Debug exposing (todo)
import Element exposing (Element, centerX, centerY, column, el, explain, fill, height, html, newTabLink, padding, paddingXY, paragraph, px, row, spacing, text, width)
import Element.Font exposing (center, justify, underline)
import Html exposing (i)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewTypes exposing (ViewData)


introductionSection : ViewData -> Element Msg
introductionSection { h } =
    column [ width fill, paddingXY 24 <| floor (h / 4), centerX, centerY ]
        [ paragraph [ padding 24, justify ] [ text introtext ]
        , linksToGithubAndGitlab
        ]


introtext =
    "Software developer located in Oslo. I enjoy coding (of course), studying korean, chess, math, skateboarding and MTG."


linksToGithubAndGitlab : Element Msg
linksToGithubAndGitlab =
    row [ centerX, spacing 50, padding 30 ]
        [ row [ spacing 12 ]
            [ el [] (html (i [ class "fab fa-github fa-2x" ] []))
            , el [] (newTabLink [] { url = "https://github.com/woldena", label = el [ underline ] (text "Github") })
            ]
        , row [ spacing 12 ]
            [ el [] (html (i [ class "fab fa-gitlab fa-2x" ] []))
            , el [] (newTabLink [] { url = "https://gitlab.com/wolden.andre", label = el [ underline ] (text "Gitlab") })
            ]
        ]
