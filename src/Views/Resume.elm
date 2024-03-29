module Views.Resume exposing (..)

import Components.CollapseTransition.Collapse exposing (collapse)
import Html exposing (Attribute, Html, div, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Model exposing (Model, collapseId1, collapseId2, collapseId3, collapseId4)
import String exposing (fromInt)
import Svg
import Svg.Attributes as SvgA
import ViewUtils.HtmlViewUtils exposing (newTabLink)


largeCircleColor =
    "#CED4DA"


circle : Int -> String -> Html Msg
circle radius color =
    let
        radiuseString =
            fromInt radius

        diameterString =
            radius * 2 |> fromInt
    in
    Svg.svg
        [ SvgA.width diameterString
        , SvgA.height diameterString
        , SvgA.viewBox <| "0 0 " ++ diameterString ++ " " ++ diameterString
        ]
        [ Svg.circle
            [ SvgA.cx radiuseString
            , SvgA.cy radiuseString
            , SvgA.r radiuseString
            , SvgA.fill color
            ]
            []
        ]


largeCircle =
    circle 10 largeCircleColor


smallCircle =
    circle 7 largeCircleColor


descriptionHeader : List (Attribute Msg) -> String -> Html Msg
descriptionHeader attributes content =
    div ([ class "description marginBottomXXS" ] ++ attributes) [ text content ]


info : List (Attribute Msg) -> String -> List (Html Msg) -> Html Msg
info attributes description content =
    div attributes
        [ descriptionHeader [] description
        , div [ class "large-text p" ] content
        ]


infoText : String -> Html Msg
infoText content =
    div [ class "large-text" ] [ text content ]


workPlaces : List (Attribute Msg) -> List (Html Msg) -> Html Msg
workPlaces attributes workplaces =
    workplaces
        |> List.map (\wp -> div [ class "cv-content-wrapper marginTopL" ] [ div [ class "left" ] [ largeCircle ], div [ class "right" ] [ wp ] ])
        |> div []


resume : Model -> Html Msg
resume model =
    div
        []
        [ div [ class "titleXXL marginTopM" ]
            [ text "Resume"
            ]
        , workPlaces []
            [ div []
                [ div [ class "workplace-title" ] [ text "January 2018 - now" ]
                , info [ class "marginTopM" ] "COMPANY" [ text "Bekk Consulting" ]
                , info [ class "marginTopM" ] "POSITION" [ text "Senior software developer" ]
                , div [ class "marginTopM marginBottomS" ] [ descriptionHeader [] "PROJECTS" ]
                , div []
                    [ div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "NAV - Arbeids- og velferdsetaten" ]
                            , infoText "June 2021 - now"
                            , infoText "Team Familie"
                            , collapse
                                ( collapseId4, model.collapseTransitions )
                                [ class "marginTopS" ]
                                [ info [] "SHORT INTRODUCTION" [ text "Application forms for child benefits and related support functions. React frontends and Kotlin/Java/Python microservices backends." ]
                                , info [ class "marginTopM" ] "TECHNOLOGIES" [ text "React, Typescript, Jest, Node, Express, Kotlin, Spring, Postgres, Kafka, Docker" ]
                                , descriptionHeader [ class "marginTopM" ] "OPEN SOURCE REPOSITORIES"
                                , div [] [ newTabLink "https://github.com/navikt/familie-ba-soknad" "familie-ba-soknad" ]
                                , div [] [ newTabLink "https://github.com/navikt/familie-ba-soknad-api" "familie-ba-soknad-api" ]
                                , div [] [ newTabLink "https://github.com/navikt/familie-ba-sak" "familie-ba-sak" ]
                                , div [ class "paddingBottomL" ] [ newTabLink "https://github.com/navikt/familie-ba-sak" "familie-ba-sak-frontend" ]
                                ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "NAV - Arbeids- og velferdsetaten" ]
                            , infoText "January 2020 - May 2021"
                            , infoText "Team Sykdom i familien"
                            , collapse
                                ( collapseId1, model.collapseTransitions )
                                [ class "marginTopS" ]
                                [ info [] "SHORT INTRODUCTION" [ text "Different application forms in some way related to attendance allowance. Several react based application forms, and Kotlin based backends. Application form data is validated before it is put on a Kafka topic ready to be evaluated." ]
                                , info [ class "marginTopM" ] "TECHNOLOGIES" [ text "React, Typescript, Formik, Gatsby, Sanity, Kotlin, Kafka, Docker, Nais (nais.io, built on Kubernetes)" ]
                                , descriptionHeader [ class "marginTopM" ] "OPEN SOURCE REPOSITORIES"
                                , div [] [ newTabLink "https://github.com/navikt/sykdom-i-familien" "sykdom-i-familien" ]
                                , div [] [ newTabLink "https://github.com/navikt/omsorgsdager-kalkulator" "omsorgsdager-kalkulator" ]
                                , div [ class "paddingBottomL" ] [ newTabLink "https://github.com/navikt/omsorgspengerutbetaling-arbeidstaker-soknad" "arbeidstaker" ]
                                ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "NAV - Arbeids- og velferdsetaten" ]
                            , infoText "May 2018 - December 2019"
                            , infoText "Team Digisos"
                            , collapse
                                ( collapseId2, model.collapseTransitions )
                                [ class "marginTopS" ]
                                [ info [] "SHORT INTRODUCTION" [ text "Application form for financial assistance. React frontend and Java backend. Users can log in with Idporten. Each submitted application is validated and transmitted to the correct municipality based on the user’s current andress." ]
                                , info [ class "marginTopM" ] "TECHNOLOGIES" [ text "React, Typescript, Redux, Java, Docker, nais.io, Kubernetes" ]
                                , descriptionHeader [ class "marginTopM" ] "OPEN SOURCE REPOSITORIES"
                                , div [] [ newTabLink "https://github.com/navikt/sosialhjelp-soknad" "sosialhjelp-soknad" ]
                                , div [] [ newTabLink "https://github.com/navikt/sosialhjelp-innsyn" "sosialhjelp-innsyn" ]
                                , div [ class "paddingBottomL" ] [ newTabLink "https://github.com/navikt/sosialhjelp-woldena-tm" "sosialhjelp-woldena-tm" ]
                                ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "Statens Vegvesen" ]
                            , infoText "January 2018 - March 2018"
                            , infoText "Team Datainn"
                            , collapse
                                ( collapseId3, model.collapseTransitions )
                                [ class "marginTopS" ]
                                [ info [] "SHORT INTRODUCTION" [ text "Collection and aggregation of traffic data along the Norwegian road network." ]
                                , info [ class "marginTopM" ] "TECHNOLOGIES" [ text "React, Java, AngularJS, Akka, Elasticsearch" ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div []
                [ div [ class "workplace-title" ] [ text "August 2012 - December 2017" ]
                , info [ class "marginTopM" ] "COMPANY" [ text "FMC Technologies (TechnipFMC)" ]
                , div [ class "marginTopM marginBottomS" ] [ descriptionHeader [] "PROJECTS / POSITIONS" ]
                , div []
                    [ div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "NGA - Next Generation Automation" ]
                            , infoText "January 2016 - December 2017"
                            , infoText "Project Engineer"
                            , info [ class "marginTopM" ] "SHORT INTRODUCTION" [ text "Engineering and prototyping of new subsea electronic module" ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "WAMS - Well Access Monitoring Systems" ]
                            , infoText "May 2014 - December 2017"
                            , infoText "Product engineer"
                            , info [ class "marginTopM" ] "SHORT INTRODUCTION" [ text "Responsible for specifying Inclinometers and Strain Gauges procured from subsuplier, and calibration of sensors after installation onto riser joints. Travel to site locations for performing calibration tests." ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "Controls and Distribution" ]
                            , infoText "May 2014 - December 2015"
                            , infoText "Project Engineer"
                            , info [ class "marginTopM" ] "SHORT INTRODUCTION" [ text "Project engineer for instrumentation on various projects, for example Snorre B" ]
                            ]
                        ]
                    , div [ class "cv-project-wrapper marginBottomXL" ]
                        [ div [ class "left" ] [ smallCircle ]
                        , div []
                            [ div [] [ text "Graduate Engineering Program" ]
                            , infoText "August 2012 - July 2014"
                            , infoText "Trainee"
                            ]
                        ]
                    ]
                ]
            , div [ class "paddingBottomXXL" ]
                [ div [ class "workplace-title" ] [ text "August 2007 - July 2012" ]
                , info [ class "marginTopM" ] "UNIVERSITY" [ text "NTNU (Norwegian University of Science and Technology)" ]
                , info [ class "marginTopM" ] "PROGRAMME" [ text "Mechanical Engineering" ]
                , info [ class "marginTopM" ] "MAIN PROFILE" [ text "Energy, Process and Fluids Engineering" ]
                , info [ class "marginTopM" ] "DESCRIPTION" [ text "Specialized in fluid mechanics and multiphase flow. Master's Thesis working for the Multiphase Flow Lab at KAIST (Korea Advanced Institute of Science and Technology)" ]
                , info [ class "marginTopM" ] "THESIS" [ newTabLink "https://ntnuopen.ntnu.no/ntnu-xmlui/bitstream/handle/11250/234896/566557_FULLTEXT01.pdf?sequence=2" "Evaluation of Split Ratio for Plug Flow at a Meso-Scale T-Junction" ]
                ]
            ]
        ]
