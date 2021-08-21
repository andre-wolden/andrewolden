module Components.CollapseAnimator.Example exposing (..)

import Components.CollapseAnimator.Collapse as Animator
import Data.DivContent exposing (aboutText)
import Html exposing (Html, text)
import Html.Attributes
import Messages exposing (Msg)
import Model exposing (Model)


example : Model -> Html Msg
example model =
    Html.div [ Html.Attributes.class "collapse-animator-example-wrapper" ]
        [ text "Not using this type of collapse"

        --, Animator.collapse model.elmCollapse1 <| Html.text aboutText
        --, Animator.collapse model.elmCollapse2 <| Html.text aboutText
        ]
