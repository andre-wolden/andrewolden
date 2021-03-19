module Messages exposing (..)

import Browser.Dom exposing (Element, Error, Viewport)
import Time
import Types exposing (Expands)


type Msg
    = NoOp
    | FocusSearchField
    | GotViewport Viewport
    | GotInitialViewport Viewport
    | Resized
    | RecieveY String
    | SetExpands Expands
    | Tick Time.Posix
    | Check Bool
    | ToggleCollapse Int
    | ElmCollapseElement (Result Error Element)
    | FindElmCollapses
    | GetElementHeight String
