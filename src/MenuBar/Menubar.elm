module Menubar.Menubar exposing (..)

import Basics as Math
import Element exposing (Attr, Attribute, Element, Length, centerX, clip, el, height, image, inFront, moveDown, moveLeft, moveRight, none, paddingXY, px, rgb255, text, width)
import Element.Background exposing (color)
import Element.Border as Border
import Element.Font as Font
import Messages exposing (Msg)
import ViewUtils.ViewConstants exposing (picturePercentage, wContent)
import ViewUtils.ViewTypes exposing (FontSizeFunc, ViewData)
import ViewUtils.ViewUtils exposing (bottomLine)



-- Element.explain Debug.todo,


menubarHeader : ViewData -> FontSizeFunc -> String -> List (Attribute Msg)
menubarHeader viewData fontSizeFunc basePath =
    [ whiteBackgroundBox viewData |> inFront
    , title viewData fontSizeFunc |> inFront
    , picture viewData basePath |> inFront
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
    let
        moveLeftAmount =
            moveHorizontalF viewData 0.6
    in
    el
        [ paddingXY 0 (viewData.hMB * 0.5 |> Math.floor)
        , Font.size (fontSizeFunc viewData.hMB viewData.w |> Math.floor)
        , centerX
        , moveDown (moveUpOrDownF viewData 0.6)
        , moveLeft moveLeftAmount
        ]
        ("André Wolden" |> text)


picture : ViewData -> String -> Element Msg
picture viewData basePath =
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

        moveRightAmount =
            moveHorizontalF viewData 1

        src =
            basePath ++ "images/4.jpg"
    in
    el
        [ centerX
        , moveRight moveRightAmount
        , moveDown ((h / 2) - radius - moveUpAmount)
        ]
    <|
        image
            [ clip
            , Border.rounded radiusInt
            , Element.height <| px diameterInt
            , Element.width <| px diameterInt
            ]
            { description = "Just a picture of me. Not important.", src = src }


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


moveHorizontalF : ViewData -> Float -> Float
moveHorizontalF { w, h, y, hMB, hMBMin } pOffHorizontal =
    let
        a =
            0.5 * pOff * (w - hMBMin) / (h - hMBMin) ^ 4
    in
    if y > (h - hMBMin) then
        a * (h - hMBMin) ^ 4 |> (*) pOffHorizontal

    else
        a * y ^ 4 |> (*) pOffHorizontal


pOff : Float
pOff =
    1


moveUpF : ViewData -> Float -> Float
moveUpF { w, h, y, hMB, hMBMin } yStart =
    let
        a =
            0.5 * pOff
    in
    if y > h - hMBMin then
        a * (h - hMBMin)

    else
        a * y


whiteBackgroundColor : Attr decorative msg
whiteBackgroundColor =
    color (rgb255 255 255 255)


coolBackgroundColor : Attr decorative msg
coolBackgroundColor =
    color (rgb255 233 196 106)
