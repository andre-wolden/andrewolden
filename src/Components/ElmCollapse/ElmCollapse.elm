module Components.ElmCollapse.ElmCollapse exposing (..)

import Animator exposing (Timeline, at, current)
import Components.ElmCollapse.ElmCollapseTypes exposing (ElmCollapse)
import Element exposing (Element, alignTop, clip, column, fill, height, htmlAttribute, padding, paragraph, px, width, wrappedRow)
import Element.Input exposing (button)
import Html.Attributes exposing (id)
import Messages exposing (Msg(..))
import Model exposing (Model)


animator1 : Animator.Animator Model
animator1 =
    Animator.animator
        |> Animator.watching
            -- we tell the animator how
            -- to get the checked timeline using .checked
            (\model ->
                let
                    ec1 =
                        model.elmCollapse1
                in
                ec1.isOpen
            )
            -- and we tell the animator how
            -- to update that timeline as well
            (\newChecked model ->
                let
                    a =
                        model.elmCollapse1

                    b =
                        { a | isOpen = newChecked }
                in
                { model | elmCollapse1 = b }
            )


animator2 : Animator.Animator Model
animator2 =
    Animator.animator
        |> Animator.watching
            -- we tell the animator how
            -- to get the checked timeline using .checked
            (\model ->
                let
                    ec2 =
                        model.elmCollapse2
                in
                ec2.isOpen
            )
            -- and we tell the animator how
            -- to update that timeline as well
            (\newChecked model ->
                let
                    a =
                        model.elmCollapse2

                    b =
                        { a | isOpen = newChecked }
                in
                { model | elmCollapse2 = b }
            )


elmCollapse : ElmCollapse -> Element Msg -> Element Msg
elmCollapse elmCollapseInfo content =
    let
        { isOpen, maybeElementHeight, collapseId } =
            elmCollapseInfo

        theHeight : Float
        theHeight =
            Animator.linear isOpen <|
                \checked ->
                    if checked then
                        case maybeElementHeight of
                            Nothing ->
                                at 30

                            Just h ->
                                at <| h + 12

                    else
                        at 45
    in
    column [ width fill, padding 40 ]
        [ wrappedRow
            [ height <| px (round theHeight)
            , clip

            --, explain todo
            ]
            [ paragraph
                [ padding 10
                , htmlAttribute <| id collapseId
                , alignTop
                ]
                [ content ]
            ]
        , button []
            { onPress = elmCollapseInfo.onPress maybeElementHeight
            , label = elmCollapseInfo.label (current isOpen)
            }
        ]
