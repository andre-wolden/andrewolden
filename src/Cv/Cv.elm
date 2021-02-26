module Cv.Cv exposing (..)

import Cv.CvUtils exposing (circle, workDateHeader)
import Debug exposing (todo)
import Element exposing (Element, alignTop, column, el, explain, fill, newTabLink, padding, paddingEach, paragraph, row, spacing, text, textColumn, width)
import Element.Font exposing (bold)
import Messages exposing (Msg)
import ViewUtils.FontUtils exposing (fontSizeLarge, fontSizeMedium, fontSizeSmall)
import ViewUtils.ViewUtils exposing (centeredSectionHeader)


cv : Float -> Element Msg
cv screenWidth =
    textColumn [ width fill, paddingEach { top = 0, right = 0, bottom = 180, left = 0 } ]
        [ centeredSectionHeader "CV"

        -- Bekk
        , row [ width fill, explain todo ]
            [ el [ alignTop, paddingEach { top = 5, right = 10, bottom = 0, left = 10 } ] circle
            , textColumn [ width fill ]
                [ paragraph [ fontSizeSmall screenWidth, bold ] [ text "January 2018 - now" ]
                , paragraph
                    [ fontSizeLarge screenWidth
                    , bold
                    ]
                    [ text "Bekk Consulting" ]
                , textColumn [ width fill, spacing 20 ]
                    [ textColumn [ width fill, spacing 16 ]
                        [ -- NAV sif
                          paragraph [ fontSizeMedium screenWidth ] [ text "NAV - Arbeids- og velferdsetaten" ]
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
                ]
            ]
        , workDateHeader "January 2018 - now" screenWidth
        , paragraph
            [ fontSizeLarge screenWidth
            , paddingEach { top = 0, right = 0, bottom = 20, left = 40 }
            , bold
            ]
            [ text "Bekk Consulting" ]
        , textColumn [ width fill, padding 20, spacing 20 ]
            [ textColumn [ width fill, spacing 16 ]
                [ -- NAV sif
                  paragraph [ fontSizeMedium screenWidth ] [ text "NAV - Arbeids- og velferdsetaten" ]
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
        , workDateHeader "August 2012 - December 2017" screenWidth

        -- NTNU
        , workDateHeader "August 2007 - June 2012" screenWidth
        ]
