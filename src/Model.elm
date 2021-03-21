module Model exposing (..)

import Animator
import Browser.Dom exposing (Element, Error, Viewport)
import Commands exposing (cmdInitialGetViewport)
import Components.ElmCollapse.ElmCollapseTypes exposing (ElmCollapse, initialElmCollapse1, initialElmCollapse2)
import Maybe exposing (Maybe)
import Messages exposing (Msg)
import Platform.Cmd exposing (batch)
import ViewTypes exposing (FontSizeFunc)


type alias Model =
    { viewport : Maybe Viewport
    , maybeY : Maybe Float
    , initialH : Maybe Float
    , fontSizeFunc : Maybe FontSizeFunc
    , elmCollapse1 : ElmCollapse
    , elmCollapse2 : ElmCollapse
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      , elmCollapse1 = initialElmCollapse1
      , elmCollapse2 = initialElmCollapse2
      }
    , batch
        [ cmdInitialGetViewport
        ]
    )
