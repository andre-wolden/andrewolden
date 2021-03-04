module Cv.Cv exposing (..)

import Cv.CvUtils exposing (circle, workDateHeader)
import Debug exposing (todo)
import Element exposing (Element, alignTop, column, el, explain, fill, mouseOver, newTabLink, padding, paddingEach, paragraph, rgb255, rgba255, row, shrink, spacing, spacingXY, text, textColumn, width, wrappedRow)
import Element.Border as Border
import Element.Events exposing (onMouseEnter)
import Element.Font exposing (bold, color, underline)
import Messages exposing (Msg(..))
import ViewUtils.FontUtils exposing (fontSizeLarge, fontSizeMedium, fontSizeSmall)
import ViewUtils.Palette exposing (greyScaleDark1, greyScaleLight1)
import ViewUtils.ViewUtils exposing (centeredSectionHeader, edges)


stdLink : { url : String, label : String } -> Element Msg
stdLink { url, label } =
    newTabLink
        [ Border.color <| rgba255 255 255 255 255
        , Border.widthEach
            { bottom = 1
            , left = 0
            , top = 0
            , right = 0
            }
        , mouseOver [ Border.color <| rgb255 220 0 78 ]
        , color <| rgb255 220 0 78
        ]
        { url = url
        , label = text label
        }
        |> el []


cv : Float -> Element Msg
cv screenWidth =
    textColumn [ width fill, paddingEach { top = 0, right = 0, bottom = 180, left = 0 } ]
        [ centeredSectionHeader "CV"

        -- Bekk
        , row [ width fill ]
            [ el [ alignTop, paddingEach { top = 3, right = 10, bottom = 0, left = 10 } ] circle
            , textColumn [ width fill ]
                [ paragraph [ fontSizeSmall screenWidth, bold, paddingEach { edges | top = 4, bottom = 26 } ] [ text "January 2018 - now" ]
                , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Company" ]
                , paragraph
                    [ fontSizeLarge screenWidth
                    , bold
                    , paddingEach { edges | bottom = 26 }
                    ]
                    [ text "Bekk Consulting" ]
                , textColumn [ width fill ]
                    [ paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Projects" ]
                    , textColumn [ width fill, paddingEach { edges | bottom = 30 } ]
                        [ -- NAV sif
                          paragraph [ fontSizeLarge screenWidth, bold, paddingEach { edges | bottom = 20 } ] [ text "NAV - Arbeids- og velferdsetaten" ]
                        , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Interval" ]
                        , paragraph [ fontSizeMedium screenWidth, paddingEach { edges | bottom = 15 } ] [ text "January 2020 - now" ]
                        , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Team" ]
                        , paragraph [ fontSizeMedium screenWidth, paddingEach { edges | bottom = 15 } ] [ text "Sykdom i familien" ]
                        , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Short introduction" ]
                        , paragraph [ fontSizeMedium screenWidth, paddingEach { edges | bottom = 15 } ] [ text "Different application forms in some way related to attendance allowance. Several react based application forms, and Kotlin based backends. Data is validated before it is put on a Kafka topic." ]
                        , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Technologies" ]
                        , paragraph [ fontSizeMedium screenWidth, paddingEach { edges | bottom = 15 } ] [ text "React, Typescript, Formik, Gatsby, Sanity, Kotlin, Kafka, Docker, Nais (nais.io, built on Kubernetes)" ]
                        , paragraph [ fontSizeSmall screenWidth, color greyScaleDark1 ] [ text "Some open source contributions" ]
                        , wrappedRow [ spacingXY 16 4 ]
                            [ stdLink
                                { url = "https://github.com/navikt/sykdom-i-familien"
                                , label = "sykdom-i-familien"
                                }
                            , stdLink
                                { url = "https://github.com/navikt/omsorgsdager-kalkulator"
                                , label = "omsorgsdager-kalkulator"
                                }
                            , stdLink
                                { url = "https://github.com/navikt/omsorgspengerutbetaling-arbeidstaker-soknad"
                                , label = "arbeidstaker"
                                }
                            ]
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

        -- FMC
        , workDateHeader "August 2012 - December 2017" screenWidth

        -- NTNU
        , workDateHeader "August 2007 - June 2012" screenWidth
        ]
