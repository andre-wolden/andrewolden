module Components.CollapseKeyframer.Collapse exposing (..)

import Data.DivContent exposing (aboutText)
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Messages exposing (Msg(..))


collapse : Bool -> Html Msg
collapse isOpen =
    let
        ( className, inlineStyle ) =
            if isOpen then
                ( "open", "max-height 0.2s" )

            else
                ( "closed", "max-height 0.2s" )
    in
    Html.div
        [ Html.Attributes.class "collapse-keyframer-wrapper"
        ]
        [ Html.div
            [ Html.Attributes.class className
            , Html.Attributes.style "transition" inlineStyle
            ]
            [ Html.text aboutText ]
        , Html.button [ Html.Events.onClick ToggleKeyframer ] [ Html.text "TOGGLE" ]
        ]
