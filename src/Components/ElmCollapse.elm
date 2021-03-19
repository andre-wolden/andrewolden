module Components.ElmCollapse exposing (..)

import Animator exposing (Timeline, at, current)
import Animator.Css exposing (div)
import Color
import Data.DivContent exposing (aboutText)
import Debug exposing (todo)
import Element exposing (Element, clip, column, el, explain, fill, height, html, htmlAttribute, layout, padding, paragraph, px, row, shrink, spacing, text, width, wrappedRow)
import Element.Input exposing (button)
import Html
import Html.Attributes as Attr exposing (id)
import Html.Events as Events
import Messages exposing (Msg(..))
import Model exposing (Model)



--"elm-collapse-1", "elm-collapse-2"


elmCollapse : Timeline Bool -> Maybe Int -> String -> Element Msg -> Element Msg
elmCollapse isOpen maybeElementHeight collapseId content =
    let
        theHeight : Float
        theHeight =
            Animator.linear isOpen <|
                \checked ->
                    if checked then
                        case maybeElementHeight of
                            Nothing ->
                                at 30

                            Just h ->
                                at <| toFloat h

                    else
                        at 45
    in
    column [ width fill, padding 40 ]
        [ wrappedRow
            [ height <| px (round theHeight)
            , clip
            , explain todo
            ]
            [ paragraph [ padding 10, htmlAttribute <| id collapseId ] [ text aboutText ] ]
        , button []
            { onPress =
                case maybeElementHeight of
                    Nothing ->
                        Just (GetElementHeight collapseId)

                    Just height ->
                        Just <| Check (not (Animator.current isOpen))
            , label =
                text <|
                    if current isOpen then
                        "vis mindre"

                    else
                        "vis mer"
            }
        , button [] { onPress = Just FindElmCollapses, label = text "Go get the Elements" }
        ]


elmCollapseExample : Model -> Element Msg
elmCollapseExample model =
    row [ width fill ]
        [ elmCollapse model.checked model.height "elm-collapse-1" <| paragraph [] [ text "Her skal det komme et laaaaangt tekst stykke." ]
        ]
