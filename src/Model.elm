module Model exposing (..)

import Browser.Dom exposing (Element, Error, Viewport)
import Browser.Navigation as Nav
import Commands exposing (cmdInitialGetViewport)
import Components.CollapseAnimator.Types exposing (ElmCollapse, initialElmCollapse1, initialElmCollapse2)
import Components.CollapseTransition.Collapse exposing (CollapseTransition)
import Maybe exposing (Maybe)
import Messages exposing (Msg)
import Platform.Cmd exposing (batch)
import Types exposing (Route)
import Url
import Url.Parser exposing (parse)
import Utils exposing (getBasePath, routeParser)
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
    , key : Nav.Key
    , route : { url : Url.Url, route : Maybe Route }
    , flags : Flags
    , basePath : String
    , testString : String
    }


type alias Flags =
    { aFlagValue : String
    }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { viewport = Nothing
      , maybeY = Just 0
      , initialH = Nothing
      , fontSizeFunc = Nothing
      , elmCollapse1 = initialElmCollapse1
      , elmCollapse2 = initialElmCollapse2
      , keyframerIsOpen = False
      , collapseTransitions = initialCollapseTransitions
      , route = { url = url, route = parse routeParser url }
      , key = key
      , flags = flags
      , basePath = getBasePath url.host
      , testString = "nothing yet"
      }
    , batch
        [ cmdInitialGetViewport
        ]
    )


collapseId1 =
    "collapse-transition-1"


collapseId2 =
    "collapse-transition-2"


collapseId3 =
    "collapse-transition-3"


initialCollapseTransitions : List CollapseTransition
initialCollapseTransitions =
    [ { elementId = collapseId1, maybeHeight = Nothing, isOpen = False }
    , { elementId = collapseId2, maybeHeight = Nothing, isOpen = False }
    , { elementId = collapseId3, maybeHeight = Nothing, isOpen = False }
    ]
