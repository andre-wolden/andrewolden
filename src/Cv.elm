module Cv exposing (..)

import Data.CvEntries exposing (cvEntries)
import Element exposing (Element, centerX, column, el, fill, paddingEach, text)
import Element.Font exposing (size)
import List exposing (map)
import Messages exposing (Msg)
import ViewTypes exposing (CvEntry, ProjectDescription)


cv : Element Msg
cv =
    column [ Element.width fill, paddingEach { top = 0, right = 0, bottom = 160, left = 0 } ]
        ([ el [ centerX, size 24, paddingEach { top = 0, right = 0, bottom = 24, left = 0 } ] (text "CV")
         ]
            ++ List.map cvEntryView cvEntries
        )


cvEntryBodyView : ProjectDescription -> Element Msg
cvEntryBodyView projectDescription =
    Element.text "her kommer beskrivelse av prosjektet"


cvEntryView : CvEntry -> Element Msg
cvEntryView cvEntry =
    column [ Element.width fill ]
        [ Element.paragraph [ Element.width fill ] [ Element.text cvEntry.year ]
        , Element.paragraph [ Element.width fill ] [ Element.text cvEntry.title ]
        , Element.paragraph [ Element.width fill ] [ Element.text cvEntry.subTitle ]
        , cvEntry.body |> map cvEntryBodyView |> Element.paragraph []
        ]
