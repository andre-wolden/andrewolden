module Components.CollapseTransition.Example exposing (..)

import Components.CollapseTransition.Collapse as Transition exposing (elementId1, elementId2, getCT)
import Html exposing (Html)
import Html.Attributes
import Messages exposing (Msg)
import Model exposing (Model)
import ViewUtils.ViewExamples exposing (exactSizeBox)


example : Model -> Html Msg
example model =
    Html.div [ Html.Attributes.class "collapse-transition-example-wrapper" ]
        [ Transition.collapse (getCT elementId1 model.collapseTransitions) exactSizeBox
        , Transition.collapse (getCT elementId2 model.collapseTransitions) exactSizeBox
        ]
