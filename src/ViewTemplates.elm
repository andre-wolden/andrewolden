module ViewTemplates exposing (..)

import Element exposing (Element, padding, paragraph, spacing, text, textColumn)
import Messages exposing (Msg)
import ViewUtils exposing (centeredSectionHeader, fullWidthSection, header1, header2, header3)


viewTemplates : Element Msg
viewTemplates =
    fullWidthSection
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
