module Model exposing (..)

import Animator
import Browser.Dom exposing (Viewport)
import Commands exposing (cmdInitialGetViewport)
import Messages exposing (Msg)
import Types exposing (Expands)
import ViewTypes exposing (FontSizeFunc)


type alias Model =
    { viewport : Maybe Viewport
    , maybeY : Maybe Float
    , initialH : Maybe Float
    , fontSizeFunc : Maybe FontSizeFunc
    , expands : Expands
    , checked : Animator.Timeline Bool
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      , expands = initialExpands
      , checked = Animator.init False
      }
    , cmdInitialGetViewport
    )


initialExpands : Expands
initialExpands =
    { exampleExpand = Animator.init False
    , example2Expand = False
    }
