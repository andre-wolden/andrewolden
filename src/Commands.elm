module Commands exposing (..)

import Browser.Dom exposing (Viewport, getViewport)
import Messages exposing (Msg(..))
import Task


cmdGetViewport : Cmd Msg
cmdGetViewport =
    Task.perform (\viewport -> GotViewport viewport) getViewport


cmdInitialGetViewport : Cmd Msg
cmdInitialGetViewport =
    Task.perform (\viewport -> GotInitialViewport viewport) getViewport
