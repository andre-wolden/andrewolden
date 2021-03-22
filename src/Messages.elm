module Messages exposing (..)

import Browser.Dom exposing (Element, Error, Viewport)
import Time


type Msg
    = NoOp
    | FocusSearchField
    | GotViewport Viewport
    | GotInitialViewport Viewport
    | Resized
    | RecieveY String
    | Tick1 Time.Posix
    | GetHeightOfElmCollapse1
    | ToggleElmCollapse1 (Maybe Float)
    | Tick2 Time.Posix
    | GetHeightOfElmCollapse2
    | ToggleElmCollapse2 (Maybe Float)
    | ToggleCollapseTransition String
    | TryToGetElementHeightAndThenMaybeToggle String
    | GotMaybeElementHeight ( Maybe Float, String )
