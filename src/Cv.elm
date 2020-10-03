module Cv exposing (..)

import Element exposing (Element, column, fill)
import Messages exposing (Msg)
import ViewTypes exposing (CvEntry)


cv : List CvEntry -> Element Msg
cv listOfCvEntries =
    column [ Element.width fill ] (List.map cvEntryView listOfCvEntries)


cvEntryView : CvEntry -> Element Msg
cvEntryView cvEntry =
    column [ Element.width fill ]
        [ Element.paragraph [ Element.width fill ] [ Element.text cvEntry.year ]
        , Element.paragraph [ Element.width fill ] [ Element.text cvEntry.title ]
        , Element.paragraph [ Element.width fill ] [ Element.text cvEntry.subTitle ]
        , cvEntry.body
        ]
