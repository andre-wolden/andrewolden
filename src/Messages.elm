module Messages exposing (..)

import Browser.Dom exposing (Viewport)


type Msg
    = NoOp
    | FocusSearchField
    | GotViewport Viewport
    | GotInitialViewport Viewport
    | Resized
    | RecieveY String
