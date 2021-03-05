module Messages exposing (..)

import Browser.Dom exposing (Viewport)
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
