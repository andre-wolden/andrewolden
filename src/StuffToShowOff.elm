module StuffToShowOff exposing (..)

import Data.DivContent exposing (headerStuffToShowOff)
import Element exposing (Element, clip, column, fill, link, paragraph, row, text, textColumn, width)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader, header3, paddedHeaderRow, paddedTextRow)


stuffToShowOff : Element Msg
stuffToShowOff =
    textColumn [ width fill ]
        [ centeredSectionHeader headerStuffToShowOff
        , paragraph [] [ text "This is not an extensive list. For example work for customers that wish to keep their repositories private is not mentioned here." ]
        , header3 "andrewolden.com"
        , paragraph [] [ text "Made with elm, in particluar to practice and test out the use of elm-ui." ]
        , header3 "Private Kubernetes Cluster"
        , link [ clip ]
            { url = ""
            , label = text "TBD medium article link coming"
            }
        , paragraph [] [ text "Article on medium of how and why I set up my own Kubernetes cluster running on Raspberry Pi's. The article also has a step by step guide that one can follow to set it up from scratch." ]
        , header3 "www.funkoa.com"
        , link [ clip ]
            { url = "https://www.funkoa.com"
            , label = text "www.funkoa.com"
            }
        , paragraph [] [ text "This website is a simple frontend served by an nginx container which is running in my Kubernetes cluster. The purpose of making the app was to see that I was able to use Traefik in my cluster to get tls (https) working." ]
        , header3 "Minesweeper in Elm"
        , link [ clip ]
            { url = "https://www.funkoa.com/minesweeper"
            , label = text "www.funkoa.com/minesweeper"
            }
        , paragraph [] [ text "My version of Minesweeper made with Elm. Currently hosted in my private cluster." ]
        , header3 "Article about making Minesweeper in Elm"
        , link [ clip ]
            { url = "https://functional.christmas/2019/4"
            , label = text "functional.christmas/2019/4"
            }
        , paragraph [] [ text "Bekk publishes a functional christmas calendar in december with a new article about functional programming for each of the days up until the 24th. I wrote about making Minesweeper in Elm." ]
        , header3 "Kalkuler antall omsorgsdager"
        , link [ clip ]
            { url = "https://github.com/navikt/omsorgsdager-kalkulator"
            , label = text "omsorgsdager-kalkulator"
            }
        , header3 "Omsorgspenger for arbeidstaker"
        , link [ clip ]
            { url = "https://github.com/navikt/omsorgspengerutbetaling-arbeidstaker-soknad"
            , label = text "omsorgspengerutbetaling-arbeidstaker-soknad"
            }
        , header3 "Innsyn i innsendt søknad"
        , link [ clip ]
            { url = "https://github.com/navikt/sif-innsyn"
            , label = text "sif-innsyn"
            }
        ]
