module View exposing (..)

import About exposing (about)
import AnimatorExample exposing (animatorExample, animatorExampleCss)
import Basics as Math
import Browser.Dom exposing (Viewport)
import Components.Collapse exposing (collapseExample)
import Components.Header.Menubar exposing (hMax, menubarHeader)
import Components.Introduction exposing (introductionSection)
import Contact exposing (contact)
import Cv.Cv exposing (cv)
import Element exposing (Element, centerX, clip, column, fill, maximum, paddingXY)
import Element.Font as Font
import Expand.Expand exposing (expandDemo)
import Html exposing (..)
import Maybe exposing (map4)
import MenubarUtils exposing (calculateViewData)
import Messages exposing (Msg(..))
import Model exposing (Model)
import StuffToShowOff exposing (stuffToShowOff)
import SwSkillz exposing (swSkillz)
import ViewConstants exposing (wContentMax)
import ViewTypes exposing (ViewData)
import ViewUtils.Palette exposing (greyScaleDark4)



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
            div []
                [ Element.layout (textFont ++ menubarHeader viewData fontSizeF)
                    (column
                        [ clip
                        , paddingXY 0 (floor (hMax viewport.scene.width) + 72)
                        , Element.width (fill |> maximum (Math.floor wContentMax))
                        , centerX
                        ]
                        [ introductionSection viewData
                        , collapseExample model
                        , cv viewData.w
                        , swSkillz
                        , stuffToShowOff viewData.w
                        , about
                        , contact

                        --, expandDemo model viewData
                        ]
                    )

                --, animatorExample model
                , animatorExampleCss model
                ]


textFont : List (Element.Attribute msg)
textFont =
    [ Font.color greyScaleDark4
    , Font.size 16
    , Font.family
        [ Font.typeface "Courier New"
        , Font.sansSerif
        ]
    ]
