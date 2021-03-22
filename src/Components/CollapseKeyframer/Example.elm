module Components.CollapseKeyframer.Example exposing (..)

import Components.CollapseKeyframer.Collapse as Keyframer
import Html exposing (Html)
import Html.Attributes
import Messages exposing (Msg)
import Model exposing (Model)


example : Model -> Html Msg
example model =
    Html.div [ Html.Attributes.class "collapse-keyframer-example-wrapper" ]
        [ Keyframer.collapse model.keyframerIsOpen

        --, Keyframer.collapse
        ]
