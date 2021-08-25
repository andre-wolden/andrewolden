module Views.IntroPageContent exposing (..)

import Html exposing (Html, a, div, h2, h4, i, text)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))
import ViewUtils.HtmlViewUtils exposing (newTabLink)
import ViewUtils.ViewTypes exposing (ViewData)


introPageContent : ViewData -> Html Msg
introPageContent { w, h, y, hMB, hMBMin } =
    div []
        [ div [ class "block" ]
            [ h2 [] [ text "Hi !" ]
            ]
        , div [ class "block" ]
            [ div [] [ text "I'm a software developer located in Oslo. I enjoy coding, studying korean, chess, math, skateboarding and MTG." ]
            , div [] [ text "I'm 35 years old and live with my wife and two awesome children." ]
            ]
        , div [ class "block" ]
            [ h4 [] [ text "Some things to see on this page:" ]
            , div [] [ a [ href "/resume" ] [ text "Resume" ] ]
            , div [] [ a [ href "/personal-projects" ] [ text "Spare time stuff" ] ]
            ]
        , div [ class "block" ]
            [ h4 [] [ text "Links to external stuff:" ]
            , div []
                [ i [ class "fab fa-github fa-2x" ] []
                , newTabLink "https://github.com/woldena" "Github"
                ]
            , div []
                [ i [ class "fab fa-gitlab fa-2x" ] []
                , newTabLink "https://gitlab.com/wolden.andre" "Gitlab"
                ]
            ]
        , div [ class "block" ]
            [ h4 [] [ text "Most relevant mentions of technologies that I use:" ]
            , div []
                [ text "Frontend: "
                , text "Elm, React, Typescript"
                ]
            , div []
                [ text "Backend: "
                , text "Java, Kotlin, Node, Python, Postgres"
                ]
            , div []
                [ text "Tools and platforms:"
                , text "Webpack, Jest, Docker, Kubernetes, Nginx, Heroku, GCP"
                ]
            ]
        ]
