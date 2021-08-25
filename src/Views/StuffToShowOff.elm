module Views.StuffToShowOff exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewUtils.HtmlViewUtils exposing (newTabLink)


stuffToShowOff : Html Msg
stuffToShowOff =
    div []
        [ div [ class "titleXXL marginTopM" ]
            [ text "A collection of things"
            ]
        , div [ class "marginTopM" ] [ text "This is a collection of things which I have worked on in my spare time. Both for fun, and to practice." ]

        -- www.andrewolden.com THIS PAGE
        , h3 [ class "marginTopM" ] [ text "andrewolden.com" ]
        , div [] [ text "Made with elm, in particluar to practice and test out the use of elm-ui." ]

        -- Private kubernetes cluster
        , div [] [ text "A text of how and why I set up my own Kubernetes cluster running on Raspberry Pi's. The cluster is running, but the text is still work in progress" ]

        -- Funkoa (served by nginx running in the cluster
        , h3 [] [ text "Funkoa" ]
        , newTabLink "" ""
        , div [] [ text "This website is a simple frontend served by an nginx container which is running in my Kubernetes cluster. The purpose of making the app was to see that I was able to use Traefik in my cluster to get tls (https) working." ]

        -- Minesweeper in elm (served by the cluster)
        , h3 [] [ text "Minesweeper" ]
        , newTabLink "" ""
        , div [] [ text "My version of Minesweeper made with Elm. Currently hosted in my private cluster." ]

        -- Minesweeper article, Bekk functional christmas
        , h3 [] [ text "Minesweeper article" ]
        , newTabLink "" ""
        , div [] [ text "Bekk publishes a functional christmas calendar in december with a new article about functional programming for each of the days up until the 24th. I wrote about making Minesweeper in Elm." ]
        ]
