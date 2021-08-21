module View exposing (..)

import Basics
import Browser.Dom exposing (Viewport)
import Components.Menubar.Menubar exposing (hMax, menubarHeader)
import Components.Menubar.MenubarUtils exposing (calculateViewData, minContentHeightAttrForFunctioningMenubar)
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
import Views.IntroPageContent exposing (introPageContent)



-- , Element.explain Debug.todo


view : Model -> Html Msg
view model =
    case model.route.route of
        Just route ->
            case route of
                Resume ->
                    div [ Html.Attributes.class "block" ] [ cv model ]

                PersonalProjects ->
                    div [] [ text "personal projects" ]

        Nothing ->
            introPage model


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


introPage : Model -> Html Msg
introPage model =
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
                    [ Html.Attributes.class "container"
                    , Html.Attributes.style "margin-top" (inFrontMarginTop viewport.scene.width)
                    , minContentHeightAttrForFunctioningMenubar viewData
                    , Html.Attributes.style "height" "auto"
                    ]
                    [ div
                        [ Html.Attributes.class "block"

                        --, Html.Attributes.style "border" "1px dotted green"
                        ]
                        [ introPageContent viewData ]
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
