module Components.Menubar.MenubarUtils exposing (..)

import Browser.Dom exposing (Viewport)
import Html exposing (Attribute)
import Html.Attributes
import String exposing (fromInt)
import ViewUtils.ViewConstants exposing (cHMax, cMBMin, cMBMinDelta, cWMax)
import ViewUtils.ViewTypes exposing (ViewData)


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


minContentHeightAttrForFunctioningMenubar : ViewData -> Attribute msg
minContentHeightAttrForFunctioningMenubar viewData =
    let
        minHeight =
            floor <| minimumContentHeight viewData.h viewData.hMBMin

        fixMeScalable =
            minHeight - 80

        minHeightString =
            fromInt fixMeScalable
    in
    Html.Attributes.style "min-height" <| minHeightString ++ "px"


minimumContentHeight : Float -> Float -> Float
minimumContentHeight viewportHeight menubarMinHeight =
    viewportHeight - menubarMinHeight
