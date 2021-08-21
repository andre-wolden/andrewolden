module ViewUtils.TitleRow exposing (..)

import Browser.Dom exposing (Viewport)
import Element exposing (Element, centerX, centerY, el, fill, px, row)
import Element.Font as Font
import Messages exposing (Msg)


breakWidth =
    768


titleFont : List (Element.Attribute msg)
titleFont =
    [ Font.color (Element.rgb 0 0 0)
    , Font.family
        [ Font.typeface "Courier New"
        , Font.sansSerif
        ]
    ]


titleRowBase : Int -> Int -> Element Msg
titleRowBase fontSize rowHeight =
    row [ Element.width fill, Element.height (px 150) ]
        [ el ([ centerX, centerY, Font.size fontSize ] ++ titleFont) (Element.text "André Wolden")
        ]


titleRowDesktop : Element Msg
titleRowDesktop =
    titleRowBase 54 150


titleRowMobile : Element Msg
titleRowMobile =
    titleRowBase 28 100


getTitleRow : Viewport -> Element Msg
getTitleRow viewport =
    if viewport.viewport.width > breakWidth then
        titleRowDesktop

    else
        titleRowMobile
