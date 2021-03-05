module Update exposing (..)

import Animator
import AnimatorExample exposing (animator)
import Commands exposing (cmdGetViewport)
import Expand.Expand exposing (expandAnimator)
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

        SetExpands expands ->
            ( { model | expands = expands }, Cmd.none )

        Tick newTime ->
            ( model
                |> Animator.update newTime animator
              -- (5) - Updating our model using our animator and the current time.
            , Cmd.none
            )

        Check newChecked ->
            ( { model
                | checked =
                    -- (6) - Here we're adding a new state to our timeline.
                    model.checked
                        |> Animator.go Animator.slowly newChecked
              }
            , Cmd.none
            )
