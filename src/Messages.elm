module Messages exposing (..)

import Browser.Dom exposing (Viewport)


type Msg
    = NoOp
    | FocusSearchField
    | GotViewport Viewport
    | Resized
    | RecieveY String
