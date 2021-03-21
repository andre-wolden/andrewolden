module Examples.ElmCollapseExample exposing (..)

import Components.ElmCollapse.ElmCollapse exposing (elmCollapse)
import Data.DivContent exposing (aboutText)
import Element exposing (Element, column, fill, paragraph, text, width)
import Messages exposing (Msg)
import Model exposing (Model)


elmCollapseExample : Model -> Element Msg
elmCollapseExample model =
    column [ width fill ]
        [ elmCollapse model.elmCollapse1 <| paragraph [] [ text aboutText ]
        , elmCollapse model.elmCollapse2 <| paragraph [] [ text aboutText ]
        ]
