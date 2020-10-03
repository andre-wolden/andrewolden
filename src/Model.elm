module Model exposing (..)

import Browser.Dom exposing (Viewport)
import Commands exposing (cmdGetViewport)
import Messages exposing (Msg)


type alias Model =
    { viewport : Maybe Viewport
    }


init : Int -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing }, cmdGetViewport )
