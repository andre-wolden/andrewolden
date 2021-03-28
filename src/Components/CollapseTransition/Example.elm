module Components.CollapseTransition.Example exposing (..)

import Components.CollapseTransition.Collapse as Transition exposing (collapseId1)
import Html exposing (Html)
import Html.Attributes
import Messages exposing (Msg)
import Model exposing (Model)
import ViewUtils.ViewExamples exposing (exactSizeBox)


example : Model -> Html Msg
example model =
    Html.div [ Html.Attributes.class "collapse-transition-example-wrapper" ]
        [ Transition.collapse ( collapseId1, model.collapseTransitions ) exactSizeBox

        --, Transition.collapse (getCT elementId2 model.collapseTransitions) exactSizeBox
        ]
