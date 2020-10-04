module View exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Cv exposing (cv)
import CvEntries exposing (cvEntries)
import Element exposing (Element, alignLeft, centerX, centerY, column, fill, maximum, padding, paddingXY, paragraph, row)
import Element.Font as Font
import Html exposing (..)
import Maybe exposing (map2)
import Menubar exposing (hMax, heightMenuBar, menubar, pictureRow)
import Messages exposing (Msg(..))
import Model exposing (Model)
import String exposing (fromFloat, fromInt)
import Types exposing (ScreenWidth)
import ViewConstants exposing (wContentMax)
import ViewUtils exposing (dotted, dottedGreen)
import ViewportAndSceneUtils exposing (viewportToScreenWidth)


view : Model -> Html Msg
view model =
    let
        a : Maybe ( Viewport, Float )
        a =
            map2 (\viewport y -> ( viewport, y )) model.viewport model.maybeY
    in
    case a of
        Nothing ->
            Element.layout [] Element.none

        Just ( viewport, y ) ->
            Element.layout (textFont ++ menubar viewport y)
                (column ([ paddingXY 0 (floor (hMax viewport.scene.width) + 72), Element.width (fill |> maximum (Math.floor wContentMax)), centerX ] ++ dotted)
                    [ introductionTextRow (viewportToScreenWidth viewport)
                    , debugSizeValuesRow viewport y
                    , Element.image [ centerX ] { description = "Link to gitlab site", src = "/images/gitlab-color.jpg" }
                    , Element.image [ centerX, Element.width fill ] { description = "Link to github site", src = "/images/mark-github-512.png" }
                    , cv cvEntries
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


debugSizeValuesRow : Viewport -> Float -> Element msg
debugSizeValuesRow viewport y =
    column [ Element.width fill ]
        [ paragraph [ alignLeft, centerY ] [ Element.text ("Scene, width = " ++ String.fromFloat viewport.scene.width) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("Scene, height = " ++ String.fromFloat viewport.scene.height) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("Viewport, x = " ++ String.fromFloat viewport.viewport.x) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("Viewport, y = " ++ String.fromFloat viewport.viewport.y) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("Viewport, width = " ++ String.fromFloat viewport.viewport.width) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("Viewport, height = " ++ String.fromFloat viewport.viewport.height) ]
        , paragraph [ alignLeft, centerY ] [ Element.text ("y = " ++ fromFloat y) ]
        ]


introductionTextRow : ScreenWidth -> Element msg
introductionTextRow screenWidth =
    row
        [ Element.width fill ]
        [ paragraph [ centerX, Font.justify ] [ Element.text introtext ]
        ]


introtext =
    "I am a dedicated nerd. I work as a software developer. In my spare time I do basically two things. I spend time with my family, or do some nerd activity. Which usually means practice coding, math or korean."
