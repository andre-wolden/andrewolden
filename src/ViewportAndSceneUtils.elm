module ViewportAndSceneUtils exposing (..)

import Basics exposing (..)
import Browser.Dom exposing (Viewport)
import Types exposing (ScreenWidth(..))


getWidth : Viewport -> Int
getWidth viewport =
    viewport.viewport.width |> floor


getMaxTextWidth : Viewport -> Int
getMaxTextWidth viewport =
    getWidth viewport - 30


getScreenWidth : Int -> ScreenWidth
getScreenWidth pxWidth =
    if pxWidth <= 375 then
        Small

    else if pxWidth <= 768 then
        Medium

    else
        Large


viewportToScreenWidth : Viewport -> ScreenWidth
viewportToScreenWidth viewport =
    getScreenWidth (getWidth viewport)


maxParagraphWidth : ScreenWidth -> Int
maxParagraphWidth screenWidth =
    case screenWidth of
        Small ->
            375

        Medium ->
            768

        Large ->
            768
