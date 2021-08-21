module ViewUtils.ViewportAndSceneUtils exposing (..)

import Basics exposing (..)
import Browser.Dom exposing (Viewport)
import Field exposing (Field)
import Matrix exposing (ColumnVector(..), Consistancy(..), Matrix(..), RowVector(..), Solution(..), solve)
import Maybe exposing (andThen, map)
import Types exposing (ScreenWidth(..))
import Vector exposing (AbelianGroup, Vector(..), VectorSpace, addVectors, getAt, scalarMultiplication, subtractVectors)
import ViewUtils.ViewConstants exposing (cHMax, cMBMin, cWMax)
import ViewUtils.ViewTypes exposing (FontSizeFunc)


getWidth : Viewport -> Int
getWidth viewport =
    viewport.viewport.width |> floor


getScreenWidth : Int -> ScreenWidth
getScreenWidth pxWidth =
    if pxWidth <= 375 then
        Small

    else if pxWidth <= 768 then
        Medium

    else
        Large


viewportToScreenWidth : Viewport -> ScreenWidth
viewportToScreenWidth viewport =
    getScreenWidth (getWidth viewport)



-- Font size


w1 : Float
w1 =
    300


w2 : Float
w2 =
    cWMax


y1 : Float
y1 =
    cMBMin


y2 : Float
y2 =
    cHMax


fw1y1 : Float
fw1y1 =
    16


fw1y2 : Float
fw1y2 =
    50


fw2y1 : Float
fw2y1 =
    24


fw2y2 : Float
fw2y2 =
    100


toVector : ColumnVector Float -> Vector Float
toVector cv =
    case cv of
        ColumnVector (Vector listFloat) ->
            Vector listFloat


getFontSizeFormula : Maybe FontSizeFunc
getFontSizeFormula =
    let
        a : Matrix Float
        a =
            Matrix
                [ RowVector (Vector [ w1 * y1, w1, y1, 1 ])
                , RowVector (Vector [ w1 * y2, w1, y2, 1 ])
                , RowVector (Vector [ w2 * y1, w2, y1, 1 ])
                , RowVector (Vector [ w2 * y2, w2, y2, 1 ])
                ]

        b : ColumnVector Float
        b =
            ColumnVector (Vector [ fw1y1, fw1y2, fw2y1, fw2y2 ])

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
                UniqueSolution cv ->
                    let
                        v : Vector Float
                        v =
                            toVector cv

                        maybeQ : Maybe { a1 : Float, a2 : Float, a3 : Float, a4 : Float }
                        maybeQ =
                            getAt 0 v
                                |> map (\a1 -> { a1 = a1 })
                                |> andThen (\p1 -> map (\a2 -> { a1 = p1.a1, a2 = a2 }) (getAt 1 v))
                                |> andThen (\p2 -> map (\a3 -> { a1 = p2.a1, a2 = p2.a2, a3 = a3 }) (getAt 2 v))
                                |> andThen (\p3 -> map (\a4 -> { a1 = p3.a1, a2 = p3.a2, a3 = p3.a3, a4 = a4 }) (getAt 3 v))
                    in
                    case maybeQ of
                        Just { a1, a2, a3, a4 } ->
                            Just (\y w -> a1 * w * y + a2 * w + a3 * y + a4)

                        Nothing ->
                            Nothing

                InfiniteSolutions n ->
                    Nothing

        Inconsistant e ->
            Nothing
