module Model exposing (..)

import Browser.Dom exposing (Viewport)
import Commands exposing (cmdGetViewport)
import Messages exposing (Msg)


type alias Model =
    { viewport : Maybe Viewport
    , y : String
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing, y = "0" }, cmdGetViewport )
