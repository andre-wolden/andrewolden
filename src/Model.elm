module Model exposing (..)

import Animator
import Browser.Dom exposing (Element, Error, Viewport)
import Commands exposing (cmdGetAllElmCollapseNodes, cmdInitialGetViewport)
import Maybe exposing (Maybe)
import Messages exposing (Msg)
import Platform.Cmd exposing (batch)
import Types exposing (Expands)
import ViewTypes exposing (FontSizeFunc)


type alias Model =
    { viewport : Maybe Viewport
    , maybeY : Maybe Float
    , initialH : Maybe Float
    , fontSizeFunc : Maybe FontSizeFunc
    , expands : Expands
    , checked : Animator.Timeline Bool
    , height : Maybe Int
    , elmCollapseResult : List Element
    , errors : List Error
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      , expands = initialExpands
      , checked = Animator.init False
      , height = Nothing
      , elmCollapseResult = []
      , errors = []
      }
    , batch
        [ cmdInitialGetViewport
        ]
    )


initialExpands : Expands
initialExpands =
    { exampleExpand = Animator.init False
    , example2Expand = False
    }
