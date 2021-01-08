module MatrixTest exposing (..)

import Element exposing (Element, el)
import Field exposing (Field)
import Matrix exposing (ColumnVector(..), Consistancy(..), Matrix(..), RowVector(..), Solution(..), solve)
import Messages exposing (Msg)
import String exposing (fromInt)
import Vector exposing (AbelianGroup, Vector(..), VectorSpace, addVectors, scalarMultiplication, subtractVectors)


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
