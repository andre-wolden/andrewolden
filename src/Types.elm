module Types exposing (..)

import Animator exposing (Timeline)


type ScreenWidth
    = Small
    | Medium
    | Large


type alias Expands =
    { exampleExpand : Timeline Bool
    , example2Expand : Bool
    }
