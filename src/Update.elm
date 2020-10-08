module Update exposing (..)

import Commands exposing (cmdGetViewport)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Utils exposing (focusSearchBox)
import ViewportAndSceneUtils exposing (getFontSizeFormula)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            ( model, Cmd.none )

        FocusSearchField ->
            ( model, focusSearchBox )

        GotViewport viewport ->
            ( { model | viewport = Just viewport }, Cmd.none )

        GotInitialViewport viewport ->
            ( { model | viewport = Just viewport, initialH = Just viewport.viewport.height, fontSizeFunc = getFontSizeFormula }, Cmd.none )

        Resized ->
            ( model, cmdGetViewport )

        RecieveY y ->
            ( { model | maybeY = String.toFloat y }
            , Cmd.none
            )
