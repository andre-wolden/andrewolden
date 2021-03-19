module Commands exposing (..)

import Browser.Dom exposing (Viewport, getElement, getViewport)
import List exposing (map)
import Messages exposing (Msg(..))
import Platform.Cmd exposing (batch)
import Task


cmdGetViewport : Cmd Msg
cmdGetViewport =
    Task.perform (\viewport -> GotViewport viewport) getViewport


cmdInitialGetViewport : Cmd Msg
cmdInitialGetViewport =
    Task.perform (\viewport -> GotInitialViewport viewport) getViewport


elmCollapseUids : List String
elmCollapseUids =
    [ "elm-collapse-1", "elm-collapse-2" ]


cmdGetAllElmCollapseNodes : Cmd Msg
cmdGetAllElmCollapseNodes =
    elmCollapseUids
        |> map getElement
        |> map (Task.attempt (\result -> ElmCollapseElement result))
        |> batch


cmdGetElmCollapseElement : String -> Cmd Msg
cmdGetElmCollapseElement uuid =
    getElement uuid
        |> Task.attempt (\result -> ElmCollapseElement result)
