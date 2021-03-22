module Components.CollapseAnimator.Types exposing (..)

import Animator exposing (Timeline, current, init)
import Element exposing (Element, text)
import Html exposing (Html)
import Messages exposing (Msg(..))


type alias ElmCollapse =
    { isOpen : Timeline Bool
    , maybeElementHeight : Maybe Float
    , collapseId : String
    , onPress : Maybe Float -> Msg
    , label : Bool -> Html Msg
    }


initialElmCollapse1 : ElmCollapse
initialElmCollapse1 =
    { collapseId = "elm-collapse-1"
    , isOpen = init False
    , maybeElementHeight = Nothing
    , onPress =
        \maybeElementHeight ->
            case maybeElementHeight of
                Nothing ->
                    GetHeightOfElmCollapse1

                Just height ->
                    ToggleElmCollapse1 (Just height)
    , label =
        \isOpen ->
            Html.text <|
                if isOpen then
                    "vis mindre"

                else
                    "vis mer"
    }


initialElmCollapse2 : ElmCollapse
initialElmCollapse2 =
    { collapseId = "elm-collapse-2"
    , isOpen = init False
    , maybeElementHeight = Nothing
    , onPress =
        \maybeElementHeight ->
            case maybeElementHeight of
                Nothing ->
                    GetHeightOfElmCollapse2

                Just height ->
                    ToggleElmCollapse2 (Just height)
    , label =
        \isOpen ->
            Html.text <|
                if isOpen then
                    "vis mindre"

                else
                    "vis mer"
    }
