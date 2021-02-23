module Cv exposing (..)

import Data.CvEntries exposing (cvEntries)
import Debug exposing (todo)
import Element exposing (Element, alignTop, centerX, column, el, explain, fill, height, paddingEach, paragraph, px, rgb, row, text, width)
import Element.Background exposing (color)
import Element.Border exposing (rounded)
import Element.Font exposing (bold, size)
import List exposing (map)
import Maybe exposing (withDefault)
import Messages exposing (Msg)
import ViewTypes exposing (CvEntry, ProjectDescription)


startView : String -> List (Element Msg)
startView start =
    [ el [] (text start) ]


endView : String -> List (Element Msg)
endView end =
    [ el [] (text end) ]


ifContent : Maybe String -> (String -> List (Element Msg)) -> List (Element Msg)
ifContent maybeString func =
    case maybeString of
        Just string ->
            func string

        Nothing ->
            []


cv : Element Msg
cv =
    column [ width fill, paddingEach { top = 0, right = 0, bottom = 160, left = 0 } ]
        ([ el [ centerX, size 24, paddingEach { top = 0, right = 0, bottom = 24, left = 0 } ] (text "CV")
         ]
            ++ List.map cvEntryView cvEntries
        )


cvEntryBodyView : ProjectDescription -> Element Msg
cvEntryBodyView projectDescription =
    column []
        ([ el [] (text projectDescription.title) ]
            ++ ifContent projectDescription.start startView
            ++ ifContent projectDescription.end endView
        )


cvEntryView : CvEntry -> Element Msg
cvEntryView cvEntry =
    row [ paddingEach { top = 30, right = 30, bottom = 30, left = 30 } ]
        [ column [ width (px 40), alignTop, paddingEach { top = 18, right = 0, bottom = 0, left = 0 } ]
            [ el [ color (rgb 0.37 0.67 0.86), rounded 10, width (px 20), height (px 20) ] (text " ")
            ]
        , column [ width fill ]
            [ paragraph [ width fill ] [ text cvEntry.year ]
            , paragraph [ width fill, size 24, bold ] [ text cvEntry.title ]
            , paragraph [ width fill, paddingEach { top = 0, right = 0, bottom = 22, left = 0 } ] [ text cvEntry.subTitle ]
            , cvEntry.body |> map cvEntryBodyView |> column [ width fill, explain todo ]
            ]
        ]
