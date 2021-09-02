module Views.IntroPageContent exposing (..)

import Emoji exposing (text_)
import Html exposing (Html, a, div, h2, h4, i, p, text)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))
import ViewUtils.HtmlViewUtils exposing (newTabLink)
import ViewUtils.ViewTypes exposing (ViewData)


introPageContent : ViewData -> Html Msg
introPageContent { w, h, y, hMB, hMBMin } =
    div []
        [ div [ class "block" ]
            [ h2 [] [ text "Hi !" ]
            , div [ class "paddingBottomM" ]
                [ text <|
                    """I work as a software developer, and I live in Oslo. I enjoy coding, studying korean, chess, math, skateboarding and MTG."""
                ]
            , div [ class "alignRight" ] [ text "...and beer, and country music.", text_ "😅" ]
            ]
        , div [ class "block" ]
            [ h4 []
                [ text "Some things to see on this page" ]
            , div [ class "internal-links-block-wrapper" ]
                [ div [] [ a [ href "/resume" ] [ text "Resume" ] ]
                , div [] [ a [ href "/personal-projects" ] [ text "Spare time stuff" ] ]
                ]
            ]
        , div [ class "block" ]
            [ h4 [] [ text "Links to external stuff" ]
            , div [ class "external-links-block-wrapper" ]
                [ div [ class "backToIntroPageWrapper" ]
                    [ i [ class "fab fa-github fa-2x" ] []
                    , p [ class "getSomeSpacing" ] [ newTabLink "https://github.com/woldena" "Github" ]
                    ]
                , div [ class "backToIntroPageWrapper" ]
                    [ i [ class "fab fa-gitlab fa-2x" ] []
                    , p [ class "getSomeSpacing" ] [ newTabLink "https://gitlab.com/wolden.andre" "Gitlab" ]
                    ]
                , div [ class "backToIntroPageWrapper" ]
                    [ i [ class "fab fa-linkedin fa-2x" ] []
                    , p [ class "getSomeSpacing" ] [ newTabLink "https://www.linkedin.com/in/andr%C3%A9-wolden-26a56767" "LinkedIn" ]
                    ]
                ]
            ]
        , div [ class "block paddingBottomXXL" ]
            [ h4 [] [ text "Most relevant mentions of technologies that I use" ]
            , div [ class "marginTopL" ]
                [ p [ class "underscore" ] [ text "Frontend: " ]
                , p [] [ text "Elm, React, Typescript" ]
                ]
            , div [ class "marginTopL" ]
                [ p [ class "underscore" ] [ text "Backend: " ]
                , p [] [ text "Java, Kotlin, Node, Python, Postgres" ]
                ]
            , div [ class "marginTopL" ]
                [ p [ class "underscore" ] [ text "Tools and platforms:" ]
                , p [] [ text "Webpack, Jest, Docker, Kubernetes, Nginx, Heroku, GCP" ]
                ]
            ]
        ]
