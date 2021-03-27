module Cv2 exposing (..)

import Html exposing (Html, div, text)
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
        , div [ class "large-text" ] [ text content ]
        ]


cv : Model -> Html Msg
cv model =
    div
        [ class "dotted"
        ]
        [ div [ class "titleXXL" ]
            [ text "CV"
            ]
        , div
            [ class "cv-content-wrapper"
            ]
            [ div [ class "left" ]
                [ largeCircle
                ]
            , div [ class "dotted" ]
                [ div [ class "workplace-title" ] [ text "January 2018 - now" ]
                , info "COMPANY" "Bekk Consulting"
                , info "POSITION" "Senior software developer"
                , div [ class "marginTopM marginBottomXS" ] [ descriptionHeader "PROJECTS" ]
                , div [ class "cv-content-wrapper" ]
                    [ div [] [ smallCircle ]
                    , div [] [ text "akjsnd" ]
                    ]
                ]
            ]
        ]
