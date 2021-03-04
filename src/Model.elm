module Model exposing (..)

import Browser.Dom exposing (Viewport)
import Commands exposing (cmdInitialGetViewport)
import Messages exposing (Msg)
import ViewTypes exposing (FontSizeFunc)


type alias Model =
    { viewport : Maybe Viewport
    , maybeY : Maybe Float
    , initialH : Maybe Float
    , fontSizeFunc : Maybe FontSizeFunc
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      }
    , cmdInitialGetViewport
    )
