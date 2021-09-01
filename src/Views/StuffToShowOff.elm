module Views.StuffToShowOff exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import ViewUtils.HtmlViewUtils exposing (newTabLink)


stuffToShowOff : Html Msg
stuffToShowOff =
    div [ class "paddingBottomXXL" ]
        [ div [ class "block" ]
            [ div [ class "titleXXL marginTopM" ]
                [ text "A collection of things"
                ]
            , div [ class "marginTopM" ] [ text "This is a collection of things which I have worked on in my spare time. Both for fun, and to practice." ]
            ]

        -- www.andrewolden.com THIS PAGE
        , div [ class "block" ]
            [ h3 [ class "marginTopM" ] [ text "andrewolden.com" ]
            , div []
                [ text <|
                    """
                    andrewolden.com is made using Elm.
                    I chose Elm to get in some more functional programming practice,
                    and at the same time test out elm-ui.
                    The repository is at
                    """
                , newTabLink "https://github.com/woldena/andrewolden" "https://github.com/woldena/andrewolden"
                ]
            ]

        -- Private kubernetes cluster
        , div [ class "block" ]
            [ h3 [] [ text "Kubernetes cluster" ]
            , div []
                [ text <|
                    """
                    I built a Kubernetes cluster at home. It's running on a couple of Raspberry Pi's.
                    The reason for doing that was again to get hands on practice, but also because I wanted to have
                    a free place to run any hobby app that I wanted.
                    So often I wanted to have something running somewhere. Often I would pay about 10$ a month choosing to run it on Heroku
                    But I just got a headache thinking about whether I would keep paying for it each month or not
                    I just didn't want to have to think about it anymore.
                    I've started writing an article about it.
                    It's not finished, but if you're interested you can find the article at
                    """
                , newTabLink "https://www.funkoa.com/articles" "https://www.funkoa.com/articles"
                ]
            ]

        -- Funkoa (served by nginx running in the cluster
        , div [ class "block" ]
            [ h3 [] [ text "Funkoa" ]
            , newTabLink "https://www.funkoa.com" "https://www.funkoa.com"
            , div []
                [ text
                    """
                    This website is a simple frontend served by an nginx container which is running in my Kubernetes cluster.
                    The purpose of making the app was to see that I was able to use Traefik in my cluster to get tls (https) working.
                    And also to get any other app available at a subpath of the domain.
                    """
                ]
            ]

        -- Minesweeper in elm (served by the cluster)
        , div [ class "block" ]
            [ h3 [] [ text "Minesweeper" ]
            , newTabLink "https://www.funkoa.com/minesweeper" "https://www.funkoa.com/minesweeper"
            , div [] [ text "My version of Minesweeper made with Elm. Currently hosted in my private cluster." ]
            ]

        -- Minesweeper article, Bekk functional christmas
        , div [ class "block marginBottomXXL" ]
            [ h3 [] [ text "Minesweeper article" ]
            , newTabLink "" ""
            , div []
                [ text <|
                    """
                    Bekk publishes a functional christmas calendar in december with a new article about functional programming for each of the days up until the 24th.
                    I wrote about making Minesweeper in Elm.
                    """
                ]
            ]
        ]
