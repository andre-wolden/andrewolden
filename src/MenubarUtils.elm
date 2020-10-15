module MenubarUtils exposing (..)

import Browser.Dom exposing (Viewport)
import ViewConstants exposing (cHMax, cMBMin, cMBMinDelta, cWMax)
import ViewTypes exposing (ViewData)


calculateViewData : Viewport -> Float -> Float -> ViewData
calculateViewData viewport y initialH =
    let
        wScene : Float
        wScene =
            viewport.scene.width

        hScene : Float
        hScene =
            initialH

        w : Float
        w =
            if wScene < cWMax then
                wScene

            else
                cWMax

        h : Float
        h =
            if hScene < cHMax then
                hScene

            else
                cHMax

        hMBMin : Float
        hMBMin =
            cMBMin + cMBMinDelta * (h / cHMax) * (w / cWMax)

        hMBtemp : Float
        hMBtemp =
            h - y

        hMB : Float
        hMB =
            if hMBtemp >= hMBMin then
                hMBtemp

            else
                hMBMin
    in
    { w = w, h = h, y = y, hMB = hMB, hMBMin = hMBMin }
