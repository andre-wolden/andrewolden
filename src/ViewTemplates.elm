module ViewTemplates exposing (..)

import Element exposing (Element, column, fill, padding, paragraph, spacing, text, textColumn, width)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader, header1, header2, header3)


viewTemplates : Element Msg
viewTemplates =
    column [ width fill ]
        [ centeredSectionHeader "Title (Test of View Components)"
        , header1 "Header 1"
        , paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
        , header2 "Header 2"
        , paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
        , header3 "Header 3"
        , paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
        , textColumn [ spacing 10, padding 10 ]
            [ paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
            , paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
            , paragraph [] [ text "This is a paragraph that can have a lot of text..." ]
            ]
        ]
