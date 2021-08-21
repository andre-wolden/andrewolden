module Views.Contact exposing (..)

import Data.DivContent exposing (contactBottomText, contactTitle, emailAddress)
import Element exposing (Element, column, fill, paragraph, text, width)
import Messages exposing (Msg)


contact : Element Msg
contact =
    column [ width fill ]
        [ paragraph [] [ text contactTitle ]
        , paragraph [] [ text emailAddress ]
        , paragraph [] [ text contactBottomText ]
        ]
