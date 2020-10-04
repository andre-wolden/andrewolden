module Model exposing (..)

import Browser.Dom exposing (Viewport)
import Commands exposing (cmdGetViewport)
import Messages exposing (Msg)


type alias Model =
    { viewport : Maybe Viewport
    , maybeY : Maybe Float
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing, maybeY = Just 0 }, cmdGetViewport )
