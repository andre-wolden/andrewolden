module Components.ElmCollapse.ElmCollapseTypes exposing (..)

import Animator exposing (Timeline, current, init)
import Element exposing (Element, text)
import Messages exposing (Msg(..))


type alias ElmCollapse =
    { isOpen : Timeline Bool
    , maybeElementHeight : Maybe Float
    , collapseId : String
    , onPress : Maybe Float -> Maybe Msg
    , label : Bool -> Element Msg
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
                    Just GetHeightOfElmCollapse1

                Just height ->
                    Just (ToggleElmCollapse1 (Just height))
    , label =
        \isOpen ->
            text <|
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
                    Just GetHeightOfElmCollapse2

                Just height ->
                    Just <|
                        ToggleElmCollapse2 (Just height)
    , label =
        \isOpen ->
            text <|
                if isOpen then
                    "vis mindre"

                else
                    "vis mer"
    }
