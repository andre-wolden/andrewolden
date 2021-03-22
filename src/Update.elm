module Update exposing (..)

import Animator
import Commands exposing (cmdGetHeightElmCollapse1, cmdGetHeightElmCollapse2, cmdGetViewport)
import Components.CollapseAnimator.Collapse exposing (animator1, animator2)
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

        Tick1 newTime ->
            ( model
                |> Animator.update newTime animator1
              -- (5)  Updating our model using our animator and the current time.
            , Cmd.none
            )

        GetHeightOfElmCollapse1 ->
            ( model, cmdGetHeightElmCollapse1 model.elmCollapse1 )

        ToggleElmCollapse1 maybeHeightFloat ->
            let
                elmCollapse1 =
                    model.elmCollapse1

                updatedElmCollapse1 =
                    { elmCollapse1
                        | isOpen =
                            Animator.go Animator.quickly (not (Animator.current elmCollapse1.isOpen)) elmCollapse1.isOpen
                        , maybeElementHeight = maybeHeightFloat
                    }
            in
            ( { model | elmCollapse1 = updatedElmCollapse1 }, Cmd.none )

        Tick2 newTime ->
            ( model
                |> Animator.update newTime animator2
              -- (5)  Updating our model using our animator and the current time.
            , Cmd.none
            )

        GetHeightOfElmCollapse2 ->
            ( model, cmdGetHeightElmCollapse2 model.elmCollapse2 )

        ToggleElmCollapse2 maybeHeightFloat ->
            let
                elmCollapse2 =
                    model.elmCollapse2

                updatedElmCollapse2 =
                    { elmCollapse2
                        | isOpen =
                            Animator.go Animator.quickly (not (Animator.current elmCollapse2.isOpen)) elmCollapse2.isOpen
                        , maybeElementHeight = maybeHeightFloat
                    }
            in
            ( { model | elmCollapse2 = updatedElmCollapse2 }, Cmd.none )

        ToggleKeyframer ->
            ( { model | keyframerIsOpen = not model.keyframerIsOpen }, Cmd.none )
