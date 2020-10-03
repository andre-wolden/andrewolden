module Update exposing (..)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Utils exposing (focusSearchBox)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            ( model, Cmd.none )

        FocusSearchField ->
            ( model, focusSearchBox )

        GotViewport viewport ->
            ( { model | viewport = Just viewport }, Cmd.none )
