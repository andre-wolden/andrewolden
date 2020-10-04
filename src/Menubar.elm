module Menubar exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Element exposing (Attr, Attribute, Element, Length, centerX, centerY, clip, column, el, fill, height, image, inFront, none, padding, paddingXY, px, rgb255, row, spacing, text, width)
import Element.Background exposing (color)
import Element.Border as Border
import Element.Font as Font
import Messages exposing (Msg)
import TitleRow exposing (getTitleRow)
import ViewConstants exposing (wContent, wContentMax)
import ViewUtils exposing (dotted)



-- Element.explain Debug.todo,


menubar : Viewport -> Float -> List (Attribute Msg)
menubar viewport y =
    [ whiteBackgroundBox viewport y

    --, bottomLine viewport y
    , title viewport y
    , picture viewport y
    ]


whiteBackgroundBox : Viewport -> Float -> Attribute Msg
whiteBackgroundBox viewport y =
    el [ width fill, whiteBackgroundColor, heightMenuBarAttribute viewport y, Element.explain Debug.todo ] none
        |> inFront


heightMenuBarAttribute : Viewport -> Float -> Attribute msg
heightMenuBarAttribute viewport y =
    heightMenuBar viewport.scene.width y
        |> Math.floor
        |> px
        |> height


hMax : Float -> Float
hMax wContent =
    let
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


title : Viewport -> Float -> Attribute Msg
title viewport y =
    el [ paddingXY 0 700, centerX, Font.size 70 ] (text "André Wolden")
        |> inFront


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


titleBoxHeight : Viewport -> Float -> Float
titleBoxHeight viewport y =
    32


totalPadding : Viewport -> Float -> Float
totalPadding viewport y =
    64


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
