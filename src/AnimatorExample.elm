module AnimatorExample exposing (..)

import Animator
import Animator.Inline
import Browser
import Color
import Data.DivContent exposing (aboutText)
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events as Events
import Messages exposing (Msg(..))
import Model exposing (Model)
import Time


animator : Animator.Animator Model
animator =
    Animator.animator
        |> Animator.watching
            -- we tell the animator how
            -- to get the checked timeline using .checked
            .checked
            -- and we tell the animator how
            -- to update that timeline as well
            (\newChecked model ->
                { model | checked = newChecked }
            )


animatorExample : Model -> Html Msg
animatorExample model =
    div
        [ Attr.class "root"
        ]
        [ div
            [ Attr.class "viewport"
            ]
            [ viewHugeCheckbox model.checked
            ]
        ]


viewHugeCheckbox : Animator.Timeline Bool -> Html Msg
viewHugeCheckbox checked =
    div
        [ Attr.style "display" "flex"
        , Attr.style "align-items" "center"
        , Attr.style "flex-direction" "column"
        ]
        [ div
            [ Attr.style "display" "flex"
            , Attr.style "align-items" "center"
            , Attr.style "cursor" "pointer"
            , Events.onClick (Check (not (Animator.current checked)))
            ]
            [ div
                -- (7) - Rendering our timeline as inline styles.
                -- What we're doing here is mapping our timeline states
                -- to what values they should be in the view.
                -- Elm animator then uses these to interpolate where we should be.
                [ Animator.Inline.backgroundColor checked <|
                    \state ->
                        if state then
                            Color.rgb255 255 96 96

                        else
                            Color.white
                , Animator.Inline.borderColor checked <|
                    \state ->
                        if state then
                            Color.rgb255 255 96 96

                        else
                            Color.black
                , Attr.class "checkbox"
                ]
                [ div
                    [ Animator.Inline.opacity checked <|
                        \state ->
                            if state then
                                Animator.at 1

                            else
                                Animator.at 0
                    , Animator.Inline.transform
                        { position = { x = 0, y = 0 }
                        , rotate =
                            Animator.move checked <|
                                \state ->
                                    if state then
                                        Animator.at (turns 0)

                                    else
                                        Animator.at (turns 0.05)
                        , scale =
                            Animator.move checked <|
                                \state ->
                                    if state then
                                        Animator.at 1

                                    else
                                        Animator.at 0.8
                        }
                    ]
                    [ text "!" ]
                ]
            , span
                [ Attr.style "margin-left" "32px"
                , Attr.style "font-size" "190px"
                ]
                [ text "Click me" ]
            ]
        , div
            [ Animator.Inline.opacity checked <|
                \state ->
                    if state then
                        Animator.at 1

                    else
                        Animator.at 0
            ]
            [ text "Great job "
            , span
                [ Attr.style "display" "inline-block"
                ]
                [ text "👍" ]
            ]
        ]
