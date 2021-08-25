module View exposing (..)

import Basics
import Browser.Dom exposing (Viewport)
import Components.Burger exposing (backToIntroPage, burger)
import Components.Menubar.Menubar exposing (hMax, menubarHeader)
import Components.Menubar.MenubarUtils exposing (calculateViewData, minContentHeightAttrForFunctioningMenubar)
import Element exposing (Element, el)
import Element.Font as Font
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import Maybe exposing (andThen, map)
import Messages exposing (Msg(..))
import Model exposing (Model)
import String exposing (fromInt)
import Types exposing (Route(..))
import ViewUtils.Palette exposing (greyScaleDark4)
import ViewUtils.ViewTypes exposing (ViewData)
import Views.IntroPageContent exposing (introPageContent)
import Views.Resume exposing (resume)
import Views.StuffToShowOff exposing (stuffToShowOff)



-- , Element.explain Debug.todo


router : Model -> ViewData -> Html Msg
router model viewData =
    case model.route.route of
        Just route ->
            case route of
                Resume ->
                    div [ Html.Attributes.class "block" ]
                        [ backToIntroPage
                        , resume model
                        ]

                PersonalProjects ->
                    div
                        []
                        [ backToIntroPage
                        , stuffToShowOff
                        ]

        Nothing ->
            introPageContent viewData


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


view : Model -> Html Msg
view model =
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
                , div
                    [ class "container"
                    , style "margin-top" (inFrontMarginTop viewport.scene.width)
                    , minContentHeightAttrForFunctioningMenubar viewData
                    , style "height" "auto"
                    ]
                    [ div
                        [ class "block"
                        ]
                        [ router model viewData
                        ]
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
