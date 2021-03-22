module Commands exposing (..)

import Browser.Dom exposing (Element, Error, Viewport, getElement, getViewport)
import Components.CollapseAnimator.Types exposing (ElmCollapse)
import Messages exposing (Msg(..))
import Platform.Cmd
import Task


cmdGetViewport : Cmd Msg
cmdGetViewport =
    Task.perform (\viewport -> GotViewport viewport) getViewport


cmdInitialGetViewport : Cmd Msg
cmdInitialGetViewport =
    Task.perform (\viewport -> GotInitialViewport viewport) getViewport



--ToggleElmCollapse { elmCollapse | maybeElementHeight = Just }


cmdGetHeightElmCollapse1 : ElmCollapse -> Cmd Msg
cmdGetHeightElmCollapse1 elmCollapse =
    getElement elmCollapse.collapseId
        |> Task.attempt
            (\result ->
                case result of
                    Err _ ->
                        ToggleElmCollapse1 Nothing

                    Ok e ->
                        ToggleElmCollapse1 (Just e.element.height)
            )


cmdGetHeightElmCollapse2 : ElmCollapse -> Cmd Msg
cmdGetHeightElmCollapse2 elmCollapse =
    getElement elmCollapse.collapseId
        |> Task.attempt
            (\result ->
                case result of
                    Err _ ->
                        ToggleElmCollapse2 Nothing

                    Ok e ->
                        ToggleElmCollapse2 (Just e.element.height)
            )


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
