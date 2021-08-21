module Commands exposing (..)

import Browser.Dom exposing (Element, Error, Viewport, getElement, getViewport)
import Messages exposing (Msg(..))
import Platform.Cmd
import Task


cmdGetViewport : Cmd Msg
cmdGetViewport =
    Task.perform (\viewport -> GotViewport viewport) getViewport


cmdInitialGetViewport : Cmd Msg
cmdInitialGetViewport =
    Task.perform (\viewport -> GotInitialViewport viewport) getViewport


cmdGetHeightOfElement : String -> Cmd Msg
cmdGetHeightOfElement elementId =
    getElement elementId
        |> Task.attempt
            (\result ->
                case result of
                    Err _ ->
                        GotMaybeElementHeight ( Nothing, elementId )

                    Ok element ->
                        GotMaybeElementHeight ( Just element.element.height, elementId )
            )
