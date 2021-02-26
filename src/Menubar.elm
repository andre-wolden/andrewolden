module Menubar exposing (..)

import Basics as Math
import Debug exposing (todo)
import Element exposing (Attr, Attribute, Element, Length, centerX, centerY, clip, el, explain, height, image, inFront, moveDown, moveRight, moveUp, none, paddingXY, px, rgb255, text, width)
import Element.Background exposing (color)
import Element.Border as Border
import Element.Font as Font
import Messages exposing (Msg)
import ViewConstants exposing (cHMax, cMBMin, picturePercentage, wContent)
import ViewTypes exposing (FontSizeFunc, ViewData)
import ViewUtils.ViewUtils exposing (bottomLine)



-- Element.explain Debug.todo,


menubar : ViewData -> FontSizeFunc -> List (Attribute Msg)
menubar viewData fontSizeFunc =
    [ whiteBackgroundBox viewData |> inFront
    , title viewData fontSizeFunc |> inFront

    --, debugSizeValuesRow viewData |> inFront
    --, bottomLine viewport y
    , picture viewData |> inFront
    ]


whiteBackgroundBox : ViewData -> Element Msg
whiteBackgroundBox viewData =
    el ([ width (viewData.w |> Math.floor |> px), whiteBackgroundColor, heightMenuBarAttribute viewData, centerX ] ++ bottomLine) none


heightMenuBarAttribute : ViewData -> Attribute msg
heightMenuBarAttribute viewData =
    viewData.hMB
        |> Math.floor
        |> px
        |> height


hMax : Float -> Float
hMax wContent =
    let
        max : Float
        max =
            (10 / 8) * wContent + 300
    in
    if max > 900 then
        900

    else
        max


title : ViewData -> FontSizeFunc -> Element Msg
title viewData fontSizeFunc =
    el
        [ paddingXY 0 (viewData.hMB * 0.5 |> Math.floor)
        , Font.size (fontSizeFunc viewData.hMB viewData.w |> Math.floor)
        , centerX
        , moveDown (moveUpOrDownF viewData 0.6)
        ]
        ("André Wolden" |> text)


picture : ViewData -> Element Msg
picture viewData =
    let
        { w, h, y, hMB, hMBMin } =
            viewData

        diameter =
            pictureDiameter picturePercentage w hMB

        diameterInt =
            Math.floor diameter

        radius =
            diameter / 2

        radiusInt =
            Math.floor radius

        moveUpAmount =
            moveUpF viewData (h / 2)
    in
    el [ centerX, centerY, moveRight (moveRightF viewData), moveUp moveUpAmount ] <|
        image
            [ clip
            , Border.rounded radiusInt
            , Element.height <| px diameterInt
            , Element.width <| px diameterInt
            ]
            { description = "Just a picture of me...", src = "/images/4.jpg" }


pictureDiameter : Float -> Float -> Float -> Float
pictureDiameter percentage mainColumnWidth heightMenuBar =
    if mainColumnWidth < heightMenuBar then
        mainColumnWidth * percentage / 100

    else
        heightMenuBar * percentage / 100


moveUpOrDownF : ViewData -> Float -> Float
moveUpOrDownF viewData diameterPercentage =
    let
        { w, h, y, hMB, hMBMin } =
            viewData

        d =
            pictureDiameter picturePercentage w hMB
    in
    d * diameterPercentage * (hMB - hMBMin) / (h - hMBMin)


moveRightF : ViewData -> Float
moveRightF { w, h, y, hMB } =
    let
        diameter =
            pictureDiameter picturePercentage w hMB

        radius =
            diameter / 2

        maxW =
            (w / 2) - radius * 1.2

        hMBMax =
            h

        hMBMin =
            cMBMin

        --a = 1 + Debug.log "moveRightF value: " mR
    in
    maxW * (hMBMax ^ 2 - hMB ^ 2) / (hMBMax ^ 2 - hMBMin ^ 2)


moveUpF : ViewData -> Float -> Float
moveUpF { w, h, y, hMB, hMBMin } yStart =
    let
        amount =
            y * 1.3
    in
    if yStart - amount < hMBMin / 2 then
        yStart - (hMBMin / 2)

    else
        amount


whiteBackgroundColor : Attr decorative msg
whiteBackgroundColor =
    color (rgb255 255 255 255)


coolBackgroundColor : Attr decorative msg
coolBackgroundColor =
    color (rgb255 233 196 106)
