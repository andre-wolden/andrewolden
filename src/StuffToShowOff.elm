module StuffToShowOff exposing (..)

import Data.DivContent exposing (headerStuffToShowOff)
import Element exposing (Element, column, link, paragraph, row, text)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader, header3, paddedHeaderRow, paddedTextRow)


stuffToShowOff : Element Msg
stuffToShowOff =
    column []
        [ paddedHeaderRow [ centeredSectionHeader headerStuffToShowOff ]
        , column []
            [ row [] [ header3 "www.andrewolden.com" ]
            , paddedTextRow [ paragraph [] [ text "Made with elm, in particluar to practice and test out the use of elm-ui." ] ]
            ]
        , column []
            [ row [] [ header3 "Private Kubernetes Cluster" ]
            , row []
                [ link []
                    { url = ""
                    , label = text "TBD medium article link coming"
                    }
                ]
            , paddedTextRow [ paragraph [] [ text "Article on medium of how and why I set up my own Kubernetes cluster running on Raspberry Pi's. The article also has a step by step guide that one can follow to set it up from scratch." ] ]
            ]
        , column []
            [ row [] [ header3 "www.funkoa.com" ]
            , row []
                [ link []
                    { url = "https://www.funkoa.com"
                    , label = text "www.funkoa.com"
                    }
                ]
            , paddedTextRow [ paragraph [] [ text "This website is a simple frontend served by an nginx container which is running in my Kubernetes cluster. The purpose of making the app was to see that I was able to use Traefik in my cluster to get tls (https) working." ] ]
            ]
        , column []
            [ row [] [ header3 "Minesweeper in Elm" ]
            , row []
                [ link []
                    { url = "https://www.funkoa.com/minesweeper"
                    , label = text "www.funkoa.com/minesweeper"
                    }
                ]
            , paddedTextRow [ paragraph [] [ text "My version of Minesweeper made with Elm. Currently hosted in my private cluster." ] ]
            ]
        , column []
            [ row [] [ header3 "Article about making Minesweeper in Elm" ]
            , row []
                [ link []
                    { url = "https://functional.christmas/2019/4"
                    , label = text "functional.christmas/2019/4"
                    }
                ]
            , paddedTextRow [ paragraph [] [ text "For several years Bekk has published a functional christmas calendar with a new article about functional programming for each of the days. I wrote about making Minesweeper in Elm." ] ]
            ]
        ]
