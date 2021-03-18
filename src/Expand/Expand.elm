module Expand.Expand exposing (..)

import Animator exposing (Timeline, at, init, leaveSmoothly)
import Animator.Css exposing (backgroundColor, div)
import Animator.Inline
import Color exposing (rgb255)
import Data.DivContent exposing (aboutText)
import Debug exposing (todo)
import Element exposing (Attribute, Element, clipX, clipY, column, el, explain, fill, height, html, layout, padding, paragraph, px, shrink, text, width, wrappedRow)
import Element.Input exposing (button)
import Html
import Messages exposing (Msg(..))
import Model exposing (Model)
import Types exposing (Expands)
import ViewTypes exposing (ViewData)


toggleBool : Bool -> Bool
toggleBool bool =
    if bool == True then
        False

    else
        True


expandDemo : Model -> ViewData -> Element Msg
expandDemo model viewdata =
    let
        expands : Expands
        expands =
            model.expands
    in
    column [ width fill, clipX, padding 80, explain todo ]
        [ el [ padding 16 ] (text "EXPAND EXAMPLE")
        , expand
            { isOpen = model.expands.exampleExpand
            , onClick =
                SetExpands
                    { expands
                        | exampleExpand =
                            Animator.init <|
                                toggleBool <|
                                    Animator.current expands.exampleExpand
                    }
            , header = text "Header Demo1 Expand"
            , body = text aboutText
            }
        ]


type alias Props =
    { isOpen : Timeline Bool
    , onClick : Msg
    , header : Element Msg
    , body : Element Msg
    }


getter : Model -> Timeline Bool
getter model =
    model.expands.exampleExpand


setter : Timeline Bool -> Model -> Model
setter timelineBool prevModel =
    let
        currentExpands : Expands
        currentExpands =
            prevModel.expands

        updatedExpands : Expands
        updatedExpands =
            { currentExpands | exampleExpand = timelineBool }
    in
    { prevModel | expands = updatedExpands }


expandAnimator : Animator.Animator Model
expandAnimator =
    Animator.animator
        |> Animator.watching
            getter
            setter


expand : Props -> Element Msg
expand { isOpen, onClick, header, body } =
    column [ width fill ]
        [ el [ padding 12 ] header
        , button [] { onPress = Just onClick, label = text "Toggle" }
        , html <|
            div
                isOpen
                [ backgroundColor <|
                    \lambdaIsOpen ->
                        if lambdaIsOpen then
                            rgb255 255 96 96

                        else
                            Color.white
                , Animator.Css.height <|
                    \lambdaIsOpenTwo ->
                        if lambdaIsOpenTwo then
                            leaveSmoothly 2 <| at 300

                        else
                            leaveSmoothly 2 <| at 150
                ]
                []
                [ Html.text aboutText ]
        ]
