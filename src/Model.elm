module Model exposing (..)

import Animator
import Browser.Dom exposing (Element, Error, Viewport)
import Commands exposing (cmdInitialGetViewport)
import Components.CollapseAnimator.Types exposing (ElmCollapse, initialElmCollapse1, initialElmCollapse2)
import Components.CollapseTransition.Collapse exposing (CollapseTransition, initialCollapseTransitions)
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
    , keyframerIsOpen : Bool
    , collapseTransitions : List CollapseTransition
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      , elmCollapse1 = initialElmCollapse1
      , elmCollapse2 = initialElmCollapse2
      , keyframerIsOpen = False
      , collapseTransitions = initialCollapseTransitions
      }
    , batch
        [ cmdInitialGetViewport
        ]
    )
