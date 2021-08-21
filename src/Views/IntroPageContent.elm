module Views.IntroPageContent exposing (..)

import Debug exposing (toString)
import Html exposing (Html, div, i, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import ViewUtils.HtmlViewUtils exposing (newTabLink)
import ViewUtils.ViewTypes exposing (ViewData)


introPageContent : ViewData -> Html Msg
introPageContent { w, h, y, hMB, hMBMin } =
    div []
        [ text "Software developer located in Oslo. I enjoy coding (of course), studying korean, chess, math, skateboarding and MTG."
        , text "Intro page, stuff under the crazy menubar"
        , i [ class "fab fa-github fa-2x" ] []
        , newTabLink "https://github.com/woldena" "Github"
        , i [ class "fab fa-gitlab fa-2x" ] []
        , newTabLink "https://gitlab.com/wolden.andre" "Gitlab"
        , text <| toString h
        ]
