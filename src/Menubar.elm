module Menubar exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Element exposing (Attr, Attribute, Element, Length, centerX, centerY, clip, el, fill, height, image, inFront, none, paddingXY, px, rgb255, row, spacing, text, width)
import Element.Background exposing (color)
import Element.Border as Border
import Element.Font as Font
import Messages exposing (Msg)
import ViewConstants exposing (picturePercentage, wContent)
import ViewTypes exposing (FontSizeFunc, ViewData)
import ViewUtils exposing (debugSizeValuesRow, dotted)



-- Element.explain Debug.todo,


menubar : ViewData -> FontSizeFunc -> List (Attribute Msg)
menubar viewData fontSizeFunc =
    [ whiteBackgroundBox viewData |> inFront
    , title viewData fontSizeFunc |> inFront
    , debugSizeValuesRow viewData |> inFront

    --, bottomLine viewport y
    , picture viewData |> inFront
    ]


whiteBackgroundBox : ViewData -> Element Msg
whiteBackgroundBox viewData =
    el ([ width (viewData.w |> Math.floor |> px), whiteBackgroundColor, heightMenuBarAttribute viewData ] ++ dotted) none


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


hMin : Float -> Float
hMin wContent =
    80


heightMenuBar : Float -> Float -> Float
heightMenuBar wContent y =
    if y > (hMax wContent - hMin wContent) then
        hMin wContent

    else
        hMax wContent - y


bottomLine : Viewport -> Float -> Attribute Msg
bottomLine viewport y =
    el [] (text "bottom line")
        |> inFront


maxInt : Int -> Int -> Int
maxInt max value =
    if value > max then
        max

    else
        value


title : ViewData -> FontSizeFunc -> Element Msg
title viewData fontSizeFunc =
    el [ paddingXY 0 (viewData.hMB * 0.5 |> Math.floor), Font.size (fontSizeFunc viewData.hMB viewData.w |> Math.floor |> maxInt 100) ] ("André Wolden" ++ String.fromInt (Math.floor (fontSizeFunc viewData.hMB viewData.w)) |> text)


titleFontSize : ViewData -> Int
titleFontSize viewData =
    ((70 - 12) / (hMax viewData.w - hMin viewData.w))
        * viewData.hMB
        |> Math.floor


titlePaddingY : ViewData -> Int
titlePaddingY viewData =
    viewData.hMB * 2 / 3 |> Math.floor


titlePaddingX : ViewData -> Int
titlePaddingX viewData =
    viewData.w / 2 |> Math.floor


titleBoxHeight : Viewport -> Float -> Float
titleBoxHeight viewport y =
    32


totalPadding : Viewport -> Float -> Float
totalPadding viewport y =
    64


picture : ViewData -> Element Msg
picture { w, h, y, hMB } =
    let
        diameter =
            pictureDiameter picturePercentage w hMB

        diameterInt =
            Math.floor diameter

        radius =
            diameter / 2

        radiusInt =
            Math.floor radius
    in
    el [ paddingXY 0 <| Math.floor <| hMB / 2 - radius ] <|
        image
            [ clip
            , Border.rounded radiusInt
            , Element.height <| px diameterInt
            , Element.width <| px diameterInt
            ]
            { description = "Just a picture of me...", src = "/images/4.jpg" }


pictureDiameter : Float -> Float -> Float -> Float
pictureDiameter percentage width height =
    if width < height then
        width * percentage / 100

    else
        height * percentage / 100


whiteBackgroundColor : Attr decorative msg
whiteBackgroundColor =
    color (rgb255 255 255 255)
