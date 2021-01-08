module View exposing (..)

import About exposing (about)
import Basics as Math
import Browser.Dom exposing (Viewport)
import Contact exposing (contact)
import Cv exposing (cv)
import Element exposing (Element, centerX, column, el, fill, maximum, paddingXY, paragraph, px, row)
import Element.Font as Font
import Html exposing (..)
import Maybe exposing (map4)
import Menubar exposing (hMax, menubar)
import MenubarUtils exposing (calculateViewData)
import Messages exposing (Msg(..))
import Model exposing (Model)
import SwSkillz exposing (swSkillz)
import ViewConstants exposing (wContent, wContentMax)
import ViewTypes exposing (ViewData)



-- , Element.explain Debug.todo


view : Model -> Html Msg
view model =
    let
        a : Maybe { viewport : Viewport, y : Float, initialH : Float, fontSizeF : Float -> Float -> Float }
        a =
            map4 (\viewport y initialH fontSizeF -> { viewport = viewport, y = y, initialH = initialH, fontSizeF = fontSizeF })
                model.viewport
                model.maybeY
                model.initialH
                model.fontSizeFunc
    in
    case a of
        Nothing ->
            Element.layout [] Element.none

        Just { viewport, y, initialH, fontSizeF } ->
            let
                viewData : ViewData
                viewData =
                    calculateViewData viewport y initialH
            in
            Element.layout (textFont ++ menubar viewData fontSizeF)
                (column [ paddingXY 0 (floor (hMax viewport.scene.width) + 72), Element.width (fill |> maximum (Math.floor wContentMax)), centerX ]
                    [ introductionTextRow (floor viewData.h) viewData.w

                    --, Element.image [ centerX ] { description = "Link to gitlab site", src = "/images/gitlab-color.jpg" }
                    --, Element.image [ centerX, Element.width fill ] { description = "Link to github site", src = "/images/mark-github-512.png" }
                    , cv
                    , swSkillz
                    , about
                    , contact
                    ]
                )


textFont : List (Element.Attribute msg)
textFont =
    [ Font.color (Element.rgb 0 0 0)
    , Font.size 16
    , Font.family
        [ Font.typeface "Courier New"
        , Font.sansSerif
        ]
    ]


introductionTextRow : Int -> Float -> Element msg
introductionTextRow pxScreenHeight screenWidth =
    row
        [ Element.width fill, Element.height (px pxScreenHeight), Element.centerY, Element.paddingXY (floor <| 0.1 * wContent screenWidth) 0 ]
        [ paragraph [ centerX, Font.justify ] [ Element.text introtext ]
        ]


introtext =
    "I work as a software developer. In my spare time I basically do two things. I spend time with my family, and I practice some nerdy activity. Which usually means practice coding, math or korean. Here's my CV, an introduction to myself, and some other things that I would like to share."
