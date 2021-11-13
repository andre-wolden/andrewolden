module Components.CollapseAnimator.Collapse exposing (..)

import Animator exposing (Timeline, at)
import Animator.Css exposing (Attribute)
import Components.CollapseAnimator.Types exposing (ElmCollapse)
import Html exposing (Html)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Model exposing (Model)



--animator1 : Animator.Animator Model
--animator1 =
--    Animator.animator
--        |> Animator.Css.watching
--            -- we tell the animator how
--            -- to get the checked timeline using .checked
--            (\model ->
--                let
--                    ec1 =
--                        model.elmCollapse1
--                in
--                ec1.isOpen
--            )
--            -- and we tell the animator how
--            -- to update that timeline as well
--            (\updatedIsOpen model ->
--                let
--                    a =
--                        model.elmCollapse1
--
--                    b =
--                        { a | isOpen = updatedIsOpen }
--                in
--                { model | elmCollapse1 = b }
--            )
--
--
--animator2 : Animator.Animator Model
--animator2 =
--    Animator.animator
--        |> Animator.Css.watching
--            -- we tell the animator how
--            -- to get the checked timeline using .checked
--            (\model ->
--                let
--                    ec2 =
--                        model.elmCollapse2
--                in
--                ec2.isOpen
--            )
--            -- and we tell the animator how
--            -- to update that timeline as well
--            (\updatedIsOpen model ->
--                let
--                    a =
--                        model.elmCollapse2
--
--                    b =
--                        { a | isOpen = updatedIsOpen }
--                in
--                { model | elmCollapse2 = b }
--            )


collapse : ElmCollapse -> Html Msg -> Html Msg
collapse elmCollapseInfo content =
    let
        { isOpen, maybeElementHeight, collapseId } =
            elmCollapseInfo

        theHeight : Attribute Bool
        theHeight =
            Animator.Css.height
                (\checked ->
                    if checked then
                        case maybeElementHeight of
                            Nothing ->
                                at 30

                            Just h ->
                                at <| h + 12

                    else
                        at 45
                )
    in
    Html.div [ Html.Attributes.class "collapse-animator-wrapper" ]
        [ Animator.Css.div isOpen
            [ theHeight ]
            []
            [ Html.div
                [ id collapseId
                ]
                [ Html.div [ Html.Attributes.class "wrapper" ] [ content ] ]
            ]
        , Html.div []
            [ Html.button [ onClick (elmCollapseInfo.onPress maybeElementHeight) ] [ Html.text "vis mer" ]
            ]
        ]
