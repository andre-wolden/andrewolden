module Menubar exposing (..)

import Browser.Dom exposing (Viewport)
import Element exposing (Element, Length, centerX, centerY, clip, column, fill, px, rgb255, row, spacing)
import Element.Background
import Element.Border as Border
import Messages exposing (Msg)
import TitleRow exposing (getTitleRow)
import ViewUtils exposing (dotted)


menubar : Viewport -> Int -> Element Msg
menubar viewport y =
    row
        [ Element.explain Debug.todo, Element.Background.color (rgb255 255 255 255), Element.height (px (menubarHeight viewport y)), clip ]
        [ column dotted
            [ pictureRow
            , getTitleRow viewport
            ]
        ]


pictureRow : Element msg
pictureRow =
    row [ Element.width fill, centerY, spacing 30 ]
        [ Element.image [ clip, centerX, Border.rounded pictureRadius, Element.height (px pictureDiameter), Element.width (px pictureDiameter) ] { description = "Picture of me.", src = "/images/4.jpg" }
        ]


pictureRadius : Int
pictureRadius =
    120


pictureDiameter : Int
pictureDiameter =
    2 * pictureRadius


menubarMaxHeight : Viewport -> Int
menubarMaxHeight viewport =
    600


menubarMinHeight : Viewport -> Int
menubarMinHeight viewport =
    100


menubarHeight : Viewport -> Int -> Int
menubarHeight viewport y =
    if y < (menubarMaxHeight viewport - menubarMinHeight viewport) then
        menubarMaxHeight viewport - y

    else
        menubarMinHeight viewport
