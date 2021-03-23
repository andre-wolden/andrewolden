module Components.CollapseTransition.Collapse exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Messages exposing (Msg(..))
import String exposing (fromFloat)
import ViewUtils.ViewExamples exposing (exactSizeBox)


type alias CollapseTransition =
    { elementId : String
    , maybeHeight : Maybe Float
    , isOpen : Bool
    }


elementId1 =
    "collapse-transition-example-1"


elementId2 =
    "collapse-transition-example-2"


initialCollapseTransitions : List CollapseTransition
initialCollapseTransitions =
    [ { elementId = elementId1, maybeHeight = Nothing, isOpen = False }
    , { elementId = elementId2, maybeHeight = Nothing, isOpen = False }
    ]


toggle : String -> Maybe Float -> Msg
toggle elementId maybeHeightFloat =
    case maybeHeightFloat of
        Nothing ->
            TryToGetElementHeightAndThenMaybeToggle elementId

        Just _ ->
            ToggleCollapseTransition elementId


getCT : String -> List CollapseTransition -> Maybe CollapseTransition
getCT elementId list =
    list
        |> List.filter (\ct -> ct.elementId == elementId)
        |> List.head


collapse : Maybe CollapseTransition -> Html Msg -> Html Msg
collapse maybeCT content =
    case maybeCT of
        Nothing ->
            Html.div [] [ Html.text "Oops, something wrong here..." ]

        Just { elementId, maybeHeight, isOpen } ->
            let
                ( transitionValue, maxHeightValue ) =
                    case maybeHeight of
                        Nothing ->
                            ( "max-height 0.2s", "0px" )

                        Just height ->
                            let
                                -- px/s
                                speed =
                                    2000

                                time =
                                    fromFloat (height / speed)

                                transitionAttrValue =
                                    "max-height " ++ time ++ "s"
                            in
                            if isOpen then
                                ( transitionAttrValue, fromFloat height ++ "px" )

                            else
                                ( transitionAttrValue, "0px" )
            in
            Html.div
                [ Html.Attributes.class "collapse-transition-wrapper"
                ]
                [ Html.div
                    [ Html.Attributes.style "transition" transitionValue
                    , Html.Attributes.style "max-height" maxHeightValue
                    ]
                    [ Html.div [ Html.Attributes.id elementId ] [ content ] ]
                , Html.button
                    [ Html.Events.onClick (toggle elementId maybeHeight)
                    ]
                    [ Html.text "TOGGLE" ]
                ]
