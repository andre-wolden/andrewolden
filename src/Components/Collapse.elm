module Components.Collapse exposing (..)

import Animator exposing (Timeline, at, current)
import Animator.Css exposing (div)
import Color
import Data.DivContent exposing (aboutText)
import Debug exposing (todo)
import Element exposing (Element, clip, column, el, explain, fill, height, html, layout, padding, paragraph, px, row, spacing, text, width, wrappedRow)
import Element.Input exposing (button)
import Html
import Html.Attributes as Attr
import Html.Events as Events
import Messages exposing (Msg(..))
import Model exposing (Model)


collapse : Timeline Bool -> Element Msg -> Element Msg
collapse isOpen content =
    let
        a =
            Animator.linear isOpen <|
                \checked ->
                    if checked then
                        at 300

                    else
                        at 30
    in
    column [ width fill, padding 40 ]
        [ wrappedRow
            [ height <| px <| round a
            , clip
            , explain todo
            ]
            [ paragraph [] [ text aboutText ] ]
        , button []
            { onPress = Just <| Check (not (Animator.current isOpen))
            , label =
                text <|
                    if current isOpen then
                        "vis mindre"

                    else
                        "vis mer"
            }
        ]



--html <|
--    Html.div [ Attr.style "padding" "60px" ]
--        [ Animator.Css.div isOpen
--            [ Animator.Css.backgroundColor <|
--                \checked ->
--                    if checked then
--                        Color.rgb255 255 96 96
--
--                    else
--                        Color.green
--            , Animator.Css.height <|
--                \checked ->
--                    if checked then
--                        at 300
--
--                    else
--                        at 30
--            ]
--            [ Attr.style "width" "30px"
--            ]
--            [ Html.text "var det bare pga en layout inni en layout?" ]
--
--        --[ layout [] content ]
--        , Html.button [ Events.onClick (Check (not (Animator.current isOpen))) ]
--            [ Html.text
--                (if current isOpen then
--                    "vis mindre"
--
--                 else
--                    "vis mer"
--                )
--            ]
--        ]


collapseExample : Model -> Element Msg
collapseExample model =
    row [ width fill ]
        [ collapse model.checked <| paragraph [] [ text "Her skal det komme et laaaaangt tekst stykke." ]
        ]
