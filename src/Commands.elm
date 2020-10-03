module Commands exposing (..)

import Browser.Dom exposing (Viewport, getViewport)
import Messages exposing (Msg(..))
import Task


gotViewport : Viewport -> Msg
gotViewport viewport =
    GotViewport viewport


cmdGetViewport : Cmd Msg
cmdGetViewport =
    Task.perform gotViewport getViewport
