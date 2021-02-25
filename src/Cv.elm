module Cv exposing (..)

import Element exposing (Element, el, fill, height, newTabLink, padding, paddingEach, paragraph, px, rgb, row, spacing, text, textColumn, width)
import Element.Background exposing (color)
import Element.Border exposing (rounded)
import Element.Font exposing (size)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader)


circle : Element Msg
circle =
    el [ color (rgb 0.37 0.67 0.86), rounded 10, width (px 20), height (px 20) ] (text " ")


cv : Element Msg
cv =
    textColumn [ width fill, paddingEach { top = 0, right = 0, bottom = 180, left = 0 } ]
        [ centeredSectionHeader "CV"

        -- Bekk
        , row [ padding 18, spacing 18, size 24 ] [ circle, text "January 2018 - now" ]
        , paragraph [ size 18, paddingEach { top = 0, right = 0, bottom = 20, left = 40 } ] [ text "Bekk Consulting" ]
        , textColumn [ width fill, padding 20, spacing 20 ]
            [ textColumn [ width fill ]
                [ -- NAV sif
                  paragraph [] [ text "NAV - Arbeids- og velferdsetaten" ]
                , paragraph [] [ text "January 2020 - now" ]
                , paragraph [] [ text "Team Sykdom i familien (illness within the family)" ]
                , paragraph [] [ text "Different application forms in some way related to attendance allowance. Several react based application forms, and Kotlin based backends. Data is validated before it is put on a Kafka topic." ]
                , paragraph [] [ text "Technologies" ]
                , paragraph [] [ text "React, Typescript, Formik, Gatsby, Sanity, Kotlin, Kafka, Docker, Nais (nais.io, built on Kubernetes)" ]
                , newTabLink []
                    { url = "https://github.com/navikt/sykdom-i-familien"
                    , label = text "sykdom-i-familien"
                    }
                , newTabLink []
                    { url = "https://github.com/navikt/omsorgsdager-kalkulator"
                    , label = text "omsorgsdager-kalkulator"
                    }
                , newTabLink []
                    { url = "https://github.com/navikt/omsorgspengerutbetaling-arbeidstaker-soknad"
                    , label = text "omsorgspengerutbetaling-arbeidstaker"
                    }
                ]
            , textColumn [ width fill ]
                [ -- NAV digisos
                  paragraph [] [ text "NAV - Arbeids- og velferdsetaten" ]
                , paragraph [] [ text "May 2018 - December 2019" ]
                , paragraph [] [ text "Team Digisos (Social Services)" ]
                , paragraph [] [ text "Application form for financial assistance. React frontend and Java backend. Users can log in through Idporten. Each submitted application is validated and transmitted to the correct municipality based on the user’s current andress." ]
                , paragraph [] [ text "Key technologies used" ]
                , paragraph [] [ text "React, Typescript, Redux, Java, Docker, Nais (nais.io, built on Kubernetes)" ]
                , newTabLink []
                    { url = "https://github.com/navikt/sosialhjelp-soknad"
                    , label = text "sosialhjelp-soknad"
                    }
                , newTabLink []
                    { url = "https://github.com/navikt/sosialhjelp-innsyn"
                    , label = text "sosialhjelp-innsyn"
                    }
                , newTabLink []
                    { url = "https://github.com/navikt/sosialhjelp-woldena-tm"
                    , label = text "sosialhjelp-woldena-tm"
                    }
                ]
            , textColumn [ width fill ]
                [ -- Statens Vegvesen
                  paragraph [] [ text "Statens Vegvesen" ]
                , paragraph [] [ text "January 2018 - March 2018" ]
                , paragraph [] [ text "Team Datainn" ]
                , paragraph [] [ text "The team is responsible for collecting and aggregating traffic data along the Norwegian road network." ]
                , paragraph [] [ text "Key technologies used" ]
                , paragraph [] [ text "React, Java, AngularJS, Akka, Elasticsearch" ]
                ]
            ]

        -- FMC
        , row [ padding 18, spacing 18 ] [ circle, text "August 2012 - December 2017" ]

        -- NTNU
        , row [ padding 18, spacing 18 ] [ circle, text "August 2007 - June 2012" ]
        ]
