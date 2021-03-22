module Components.CollapseKeyframer.Example exposing (..)

import Components.CollapseKeyframer.Collapse as Keyframer
import Html exposing (Html)
import Html.Attributes
import Messages exposing (Msg)


example : Html Msg
example =
    Html.div [ Html.Attributes.class "collapse-keyframer-example-wrapper" ]
        [ Keyframer.collapse
        , Keyframer.collapse
        ]
