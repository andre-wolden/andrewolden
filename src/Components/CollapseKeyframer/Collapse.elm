module Components.CollapseKeyframer.Collapse exposing (..)

import Html exposing (Html)
import Html.Attributes
import Messages exposing (Msg)


collapse : Html Msg
collapse =
    Html.div [ Html.Attributes.class "collapse-keyframer-wrapper" ] [ Html.text "her kommer CollapseKeyframer" ]
