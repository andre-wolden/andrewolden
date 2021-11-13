module Update exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Commands exposing (cmdGetHeightOfElement, cmdGetViewport)
import Components.CollapseTransition.Collapse exposing (CollapseTransition)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Url
import Url.Parser exposing (parse)
import Utils exposing (focusSearchBox, routeParser)
import ViewUtils.ViewportAndSceneUtils exposing (getFontSizeFormula)


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

        ToggleCollapseTransition elementId ->
            let
                updatedCollapseTransitions =
                    model.collapseTransitions
                        |> List.map (toggleForMatchingElementId elementId)
            in
            ( { model | collapseTransitions = updatedCollapseTransitions }, Cmd.none )

        TryToGetElementHeightAndThenMaybeToggle elementId ->
            ( model, cmdGetHeightOfElement elementId )

        GotMaybeElementHeight ( maybeHeightFloat, elementId ) ->
            case maybeHeightFloat of
                Nothing ->
                    ( model, Cmd.none )

                Just height ->
                    let
                        updatedCollapseTransitions =
                            model.collapseTransitions
                                |> List.map (setHeightAndToggle elementId height)
                    in
                    ( { model | collapseTransitions = updatedCollapseTransitions }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Internal url ->
                    ( { model | testString = url.path }, Nav.pushUrl model.key (Url.toString url) )

                External href ->
                    ( { model | testString = "href external thingy" }, Nav.load href )

        UrlChanged url ->
            ( { model | route = { url = url, route = parse routeParser url } }
            , Cmd.none
            )


setHeightAndToggle : String -> Float -> CollapseTransition -> CollapseTransition
setHeightAndToggle elementId height ct =
    setHeightOnMatchingElementId elementId height ct
        |> toggleForMatchingElementId elementId


toggleForMatchingElementId : String -> CollapseTransition -> CollapseTransition
toggleForMatchingElementId elementId ct =
    if ct.elementId == elementId then
        { ct | isOpen = not ct.isOpen }

    else
        ct


setHeightOnMatchingElementId : String -> Float -> CollapseTransition -> CollapseTransition
setHeightOnMatchingElementId elementId height ct =
    if ct.elementId == elementId then
        { ct | maybeHeight = Just height }

    else
        ct
