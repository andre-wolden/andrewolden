module Menubar exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Element exposing (Attr, Attribute, Element, Length, centerX, centerY, clip, el, fill, height, image, inFront, none, paddingXY, px, rgb255, row, spacing, text, width)
import Element.Background exposing (color)
import Element.Border as Border
import Element.Font as Font
import Messages exposing (Msg)
import ViewConstants exposing (wContent)
import ViewTypes exposing (ViewData)
import ViewUtils exposing (debugSizeValuesRow, dotted)



-- Element.explain Debug.todo,


menubar : ViewData -> List (Attribute Msg)
menubar viewData =
    [ whiteBackgroundBox viewData
    , title viewData
    , debugSizeValuesRow viewData |> inFront

    --, bottomLine viewport y
    --, picture viewport y
    ]


whiteBackgroundBox : ViewData -> Attribute Msg
whiteBackgroundBox viewData =
    el ([ width (viewData.w |> Math.floor |> px), whiteBackgroundColor, heightMenuBarAttribute viewData ] ++ dotted) none
        |> inFront


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


title : ViewData -> Attribute Msg
title viewData =
    el [ centerX, paddingXY 0 (viewData.hMB * 0.5 |> Math.floor), Font.size (viewData.hMB |> Math.floor |> maxInt 45) ] (text "André Wolden")
        |> inFront


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


picture : Viewport -> Float -> Attribute Msg
picture viewport y =
    inFront <|
        el [ paddingXY (Math.floor ((viewport.scene.width / 2) - pictureRadius (wContent viewport.scene.width))) 100 ] <|
            image
                [ clip
                , Border.rounded (Math.floor (pictureRadius (wContent viewport.scene.width)))
                , Element.height (px (Math.floor (pictureDiameter (wContent viewport.scene.width))))
                , Element.width (px (Math.floor (pictureDiameter (wContent viewport.scene.width))))
                ]
                { description = "Picture of me.", src = "/images/4.jpg" }


pictureRow : Viewport -> Element msg
pictureRow viewport =
    row [ Element.width fill, centerY, spacing 30 ]
        [ Element.image
            [ clip
            , centerX
            , Border.rounded (Math.floor (pictureRadius (wContent viewport.scene.width)))
            , Element.height (px (Math.floor (pictureDiameter (wContent viewport.scene.width))))
            , Element.width (px (Math.floor (pictureDiameter (wContent viewport.scene.width))))
            ]
            { description = "Picture of me.", src = "/images/4.jpg" }
        ]


pictureRadius : Float -> Float
pictureRadius wContent =
    0.2 * wContent + 75


pictureDiameter : Float -> Float
pictureDiameter wContent =
    2 * pictureRadius wContent


whiteBackgroundColor : Attr decorative msg
whiteBackgroundColor =
    color (rgb255 255 255 255)
