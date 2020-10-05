module View exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Cv exposing (cv)
import CvEntries exposing (cvEntries)
import Element exposing (Element, centerX, column, fill, maximum, paddingXY, paragraph, row)
import Element.Font as Font
import Html exposing (..)
import Maybe exposing (map2, map3)
import Menubar exposing (hMax, menubar)
import MenubarUtils exposing (calculateViewData)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Types exposing (ScreenWidth)
import ViewConstants exposing (wContentMax)
import ViewTypes exposing (ViewData)
import ViewUtils exposing (dotted)
import ViewportAndSceneUtils exposing (viewportToScreenWidth)


view : Model -> Html Msg
view model =
    let
        a : Maybe { viewport : Viewport, y : Float, initialH : Float }
        a =
            map3 (\viewport y initialH -> { viewport = viewport, y = y, initialH = initialH }) model.viewport model.maybeY model.initialH
    in
    case a of
        Nothing ->
            Element.layout [] Element.none

        Just { viewport, y, initialH } ->
            let
                viewData : ViewData
                viewData =
                    calculateViewData viewport y initialH
            in
            Element.layout (textFont ++ menubar viewData)
                (column ([ paddingXY 0 (floor (hMax viewport.scene.width) + 72), Element.width (fill |> maximum (Math.floor wContentMax)), centerX ] ++ dotted)
                    [ introductionTextRow (viewportToScreenWidth viewport)
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


introductionTextRow : ScreenWidth -> Element msg
introductionTextRow screenWidth =
    row
        [ Element.width fill ]
        [ paragraph [ centerX, Font.justify ] [ Element.text introtext ]
        ]


introtext =
    "I am a dedicated nerd. I work as a software developer. In my spare time I do basically two things. I spend time with my family, or do some nerd activity. Which usually means practice coding, math or korean."
