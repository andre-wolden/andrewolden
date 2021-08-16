module View exposing (..)

import About exposing (about)
import Basics as Math
import Browser.Dom exposing (Viewport)
import Components.CollapseAnimator.Example as CollapseAnimator
import Components.CollapseTransition.Example as Transition
import Components.Header.Menubar exposing (hMax, menubarHeader)
import Components.Introduction exposing (introductionSection)
import Contact exposing (contact)
import Cv.Cv exposing (cv)
import Cv2 as Cv
import Data.DivContent exposing (aboutText)
import Debug exposing (todo)
import Element exposing (Element, centerX, clip, column, el, explain, fill, html, maximum, paddingEach, paddingXY)
import Element.Font as Font
import Html exposing (..)
import Html.Attributes
import Maybe exposing (map4)
import MenubarUtils exposing (calculateViewData)
import Messages exposing (Msg(..))
import Model exposing (Model)
import String exposing (fromInt)
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
                [ Element.layout (textFont ++ menubarHeader viewData fontSizeF model.basePath) (el [] (Element.text ""))

                --(column
                --    [ clip
                --    , paddingEach { top = floor (hMax viewport.scene.width) + 300, right = 0, bottom = 0, left = 0 }
                --    , Element.width (fill |> maximum (Math.floor wContentMax))
                --    , centerX
                --    ]
                --    [ html <| div [ Html.Attributes.class "dotted block" ] [ Cv.cv model ]
                --    , introductionSection viewData
                --    , cv viewData.w
                --    , swSkillz
                --    , stuffToShowOff viewData.w
                --    , about
                --    , contact
                --    ]
                --)
                --, CollapseAnimator.example model
                --, Transition.example model
                --, Html.div
                --    []
                --    [ Html.div [] [ Html.text aboutText ] ]
                , div [ Html.Attributes.class "container", Html.Attributes.style "margin-top" (inFrontMarginTop viewport.scene.width) ]
                    [ div [ Html.Attributes.class "block" ] [ Cv.cv model ]
                    ]
                ]


inFrontMarginTop : Float -> String
inFrontMarginTop width =
    fromInt (floor (hMax width) + 300) ++ "px"


textFont : List (Element.Attribute msg)
textFont =
    [ Font.color greyScaleDark4
    , Font.size 16
    , Font.family
        [ Font.typeface "Courier New"
        , Font.sansSerif
        ]
    ]
