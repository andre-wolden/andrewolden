module Cv2 exposing (..)

import Components.CollapseTransition.Collapse exposing (collapse, collapseId3)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Model exposing (Model)
import String exposing (fromInt)
import Svg
import Svg.Attributes as SvgA


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


descriptionHeader : String -> Html Msg
descriptionHeader content =
    div [ class "description" ] [ text content ]


info : String -> String -> Html Msg
info description content =
    div [ class "description-block" ]
        [ descriptionHeader description
        , div [ class "large-text p" ] [ text content ]
        ]


infoText : String -> Html Msg
infoText content =
    div [ class "large-text" ] [ text content ]


cv : Model -> Html Msg
cv model =
    div
        []
        [ div [ class "titleXXL" ]
            [ text "CV"
            ]
        , div
            [ class "cv-content-wrapper"
            ]
            [ div [ class "left" ]
                [ largeCircle
                ]
            , div []
                [ div [ class "workplace-title" ] [ text "January 2018 - now" ]
                , info "COMPANY" "Bekk Consulting"
                , info "POSITION" "Senior software developer"
                , div [ class "marginTopM marginBottomXS" ] [ descriptionHeader "PROJECTS" ]
                , div [ class "cv-content-wrapper" ]
                    [ div [] [ smallCircle ]
                    , div []
                        [ div [] [ text "NAV - Arbeids- og velferdsetaten" ]
                        , infoText "January 2020 - now"
                        , infoText "Team Sykdom i familien"
                        , collapse
                            ( collapseId3, model.collapseTransitions )
                            (div []
                                [ info "SHORT INTRODUCTION" "Different application forms in some way related to attendance allowance. Several react based application forms, and Kotlin based backends. Application form data is validated before it is put on a Kafka topic ready to be evaluated."
                                , info "TECHNOLOGIES" "React, Typescript, Formik, Gatsby, Sanity, Kotlin, Kafka, Docker, Nais (nais.io, built on Kubernetes)"
                                , descriptionHeader "OPEN SOURCE REPOSITORIES"
                                , div [] [ a [] [ text "sykdom-i-familien" ] ]
                                , div [] [ a [] [ text "omsorgsdager-kalkulator" ] ]
                                , div [] [ a [] [ text "arbeidstaker" ] ]
                                ]
                            )
                        ]
                    ]
                ]
            ]
        ]
