module View exposing (..)

import Basics
import Browser.Dom exposing (Viewport)
import Components.Burger exposing (burger)
import Components.Menubar.Menubar exposing (hMax, menubarHeader)
import Components.Menubar.MenubarUtils exposing (calculateViewData)
import CvV2.Cv exposing (cv)
import Element exposing (Element, el)
import Element.Font as Font
import Html exposing (Html, div, text)
import Html.Attributes
import Maybe exposing (andThen, map)
import Messages exposing (Msg(..))
import Model exposing (Model)
import String exposing (fromInt)
import Types exposing (Route(..))
import ViewUtils.Palette exposing (greyScaleDark4)
import ViewUtils.ViewTypes exposing (ViewData)



-- , Element.explain Debug.todo


view : Model -> Html Msg
view model =
    case model.route.route of
        Just route ->
            case route of
                Resume ->
                    resumePage model

                PersonalProjects ->
                    div [] [ text "personal projects" ]

        Nothing ->
            div [] [ text "home" ]


type alias ViewConfig =
    { viewport : Viewport
    , y : Float
    , initialH : Float
    , fontSizeF : Float -> Float -> Float
    }


maybeViewConfigOf : Model -> Maybe ViewConfig
maybeViewConfigOf { viewport, maybeY, initialH, fontSizeFunc } =
    map (\tmp -> { viewport = tmp }) viewport
        |> andThen (\tmp -> map (\y -> { viewport = tmp.viewport, y = y }) maybeY)
        |> andThen (\tmp -> map (\ih -> { viewport = tmp.viewport, y = tmp.y, initialH = ih }) initialH)
        |> andThen (\tmp -> map (\fsf -> { viewport = tmp.viewport, y = tmp.y, initialH = tmp.initialH, fontSizeF = fsf }) fontSizeFunc)


resumePage : Model -> Html Msg
resumePage model =
    case maybeViewConfigOf model of
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
                    [ burger
                    , div [ Html.Attributes.class "block" ] [ cv model ]
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
