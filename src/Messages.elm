module Messages exposing (..)

import Browser
import Browser.Dom exposing (Element, Error, Viewport)
import Url


type Msg
    = NoOp
    | FocusSearchField
    | GotViewport Viewport
    | GotInitialViewport Viewport
    | Resized
    | RecieveY String
    | ToggleCollapseTransition String
    | TryToGetElementHeightAndThenMaybeToggle String
    | GotMaybeElementHeight ( Maybe Float, String )
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
