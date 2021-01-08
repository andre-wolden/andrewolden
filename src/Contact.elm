module Contact exposing (..)

import Data.DivContent exposing (contactBottomText, contactTitle, emailAddress)
import Element exposing (Element, paragraph, row, text)
import Messages exposing (Msg)


contact : Element Msg
contact =
    row [] [ paragraph [] [ text contactTitle ], paragraph [] [ text emailAddress ], paragraph [] [ text contactBottomText ] ]
