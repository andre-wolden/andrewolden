module Cv exposing (..)

import Data.CvEntries exposing (cvEntries)
import Element exposing (Element, centerX, column, el, explain, fill, height, paddingEach, paragraph, px, rgb, row, text, width)
import Element.Background exposing (color)
import Element.Border exposing (rounded)
import Element.Font exposing (size)
import List exposing (map)
import Messages exposing (Msg)
import ViewTypes exposing (CvEntry, ProjectDescription)


cv : Element Msg
cv =
    column [ width fill, paddingEach { top = 0, right = 0, bottom = 160, left = 0 } ]
        ([ el [ centerX, size 24, paddingEach { top = 0, right = 0, bottom = 24, left = 0 } ] (text "CV")
         ]
            ++ List.map cvEntryView cvEntries
        )


cvEntryBodyView : ProjectDescription -> Element Msg
cvEntryBodyView projectDescription =
    text "her kommer beskrivelse av prosjektet"


cvEntryView : CvEntry -> Element Msg
cvEntryView cvEntry =
    row [ paddingEach { top = 30, right = 30, bottom = 30, left = 30 } ]
        [ column [ width (px 40) ]
            [ el [ color (rgb 0.37 0.67 0.86), rounded 10, width (px 20), height (px 20) ] (text " ")
            ]
        , column [ width fill ]
            [ paragraph [ width fill ] [ text cvEntry.year ]
            , paragraph [ width fill ] [ text cvEntry.title ]
            , paragraph [ width fill ] [ text cvEntry.subTitle ]
            , cvEntry.body |> map cvEntryBodyView |> paragraph []
            ]
        ]
