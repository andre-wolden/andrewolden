module Components.CollapseTransition.Collapse exposing (..)

import Html exposing (Attribute, Html)
import Html.Attributes
import Html.Events
import Messages exposing (Msg(..))
import String exposing (fromFloat)


type alias CollapseTransition =
    { elementId : String
    , maybeHeight : Maybe Float
    , isOpen : Bool
    }


collapseId1 =
    "collapse-transition-1"


collapseId2 =
    "collapse-transition-2"


collapseId3 =
    "collapse-transition-3"


initialCollapseTransitions : List CollapseTransition
initialCollapseTransitions =
    [ { elementId = collapseId1, maybeHeight = Nothing, isOpen = False }
    , { elementId = collapseId2, maybeHeight = Nothing, isOpen = False }
    , { elementId = collapseId3, maybeHeight = Nothing, isOpen = False }
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


collapse : ( String, List CollapseTransition ) -> List (Attribute Msg) -> List (Html Msg) -> Html Msg
collapse ( collapseId, listOfCts ) attributes content =
    let
        maybeCT =
            getCT collapseId listOfCts
    in
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
                                    500

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
                ([ Html.Attributes.class "collapse-transition-wrapper"
                 ]
                    ++ attributes
                )
                [ Html.div
                    [ Html.Attributes.style "transition" transitionValue
                    , Html.Attributes.style "max-height" maxHeightValue
                    , Html.Attributes.class "content"
                    ]
                    [ Html.div [ Html.Attributes.id elementId ] content ]
                , Html.div [ Html.Attributes.class "button-wrapper" ]
                    [ Html.button
                        [ Html.Events.onClick (toggle elementId maybeHeight)
                        , Html.Attributes.class "button"
                        ]
                        [ Html.text <|
                            if isOpen then
                                "show less"

                            else
                                "show more"
                        ]
                    ]
                ]
