module Components.CollapseKeyframer.Collapse exposing (..)

import Data.DivContent exposing (aboutText)
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Messages exposing (Msg(..))


collapse : Bool -> Html Msg
collapse isOpen =
    let
        theClass : String
        theClass =
            if isOpen then
                "open"

            else
                "closed"
    in
    Html.div
        [ Html.Attributes.class "collapse-keyframer-wrapper"
        ]
        [ Html.div
            [ Html.Attributes.class theClass
            ]
            [ Html.text aboutText ]
        , Html.button [ Html.Events.onClick ToggleKeyframer ] [ Html.text "TOGGLE" ]
        ]
