module View exposing (..)

import Basics as Math
import Browser.Dom exposing (Viewport)
import Cv exposing (cv)
import Data.CvEntries exposing (cvEntries)
import Element exposing (Element, centerX, column, el, fill, maximum, paddingXY, paragraph, row)
import Element.Font as Font
import Field exposing (Field)
import Html exposing (..)
import Matrix exposing (ColumnVector(..), Consistancy(..), Matrix(..), RowVector(..), Solution(..), solve)
import Maybe exposing (map4)
import Menubar exposing (hMax, menubar)
import MenubarUtils exposing (calculateViewData)
import Messages exposing (Msg(..))
import Model exposing (Model)
import String exposing (fromInt)
import Types exposing (ScreenWidth)
import Vector exposing (AbelianGroup, Vector(..), VectorSpace, addVectors, scalarMultiplication, subtractVectors)
import ViewConstants exposing (wContentMax)
import ViewTypes exposing (ViewData)
import ViewportAndSceneUtils exposing (viewportToScreenWidth)


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
                    [ introductionTextRow (viewportToScreenWidth viewport)
                    , Element.image [ centerX ] { description = "Link to gitlab site", src = "/images/gitlab-color.jpg" }
                    , Element.image [ centerX, Element.width fill ] { description = "Link to github site", src = "/images/mark-github-512.png" }
                    , cv cvEntries
                    , matrixTest
                    ]
                )


matrixTest : Element Msg
matrixTest =
    let
        a : Matrix Float
        a =
            Matrix [ RowVector (Vector [ 1, 1, 1 ]), RowVector (Vector [ 0, 2, 5 ]), RowVector (Vector [ 2, 5, -1 ]) ]

        b : ColumnVector Float
        b =
            ColumnVector (Vector [ 6, -4, 27 ])

        field : Field Float
        field =
            { zero = 0
            , one = 1
            , add = (+)
            , subtract = (-)
            , multiply = (*)
            , divide = (/)
            , power = (^)
            , negate = negate
            }

        abgroup : AbelianGroup Float
        abgroup =
            { field = field
            , addVects = addVectors field
            , subtractVects = subtractVectors field
            }

        vsm : Float -> Vector Float -> Vector Float
        vsm =
            scalarMultiplication field

        vectorSpace : VectorSpace Float
        vectorSpace =
            { abelianGroup = abgroup
            , vectorScalarMultiplication = vsm
            }

        solution : Consistancy Float
        solution =
            solve vectorSpace a b
    in
    case solution of
        Consistant s ->
            case s of
                UniqueSolution v ->
                    el [] ("debug tostring vectorsolution: " |> Element.text)

                InfiniteSolutions n ->
                    el [] ("nullity: " ++ fromInt n.nullity ++ ". rank: " ++ fromInt n.rank |> Element.text)

        Inconsistant e ->
            el [] (Element.text e)


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
