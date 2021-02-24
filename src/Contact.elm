module Contact exposing (..)

import Data.DivContent exposing (contactBottomText, contactTitle, emailAddress)
import Element exposing (Element, paragraph, text)
import Messages exposing (Msg)
import ViewUtils exposing (fullWidthSection)


contact : Element Msg
contact =
    fullWidthSection [ paragraph [] [ text contactTitle ], paragraph [] [ text emailAddress ], paragraph [] [ text contactBottomText ] ]
