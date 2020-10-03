module Utils exposing (..)

import Browser.Dom as Dom
import Http exposing (Error(..))
import Messages exposing (Msg(..))
import Task


httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        BadUrl url ->
            "BadUrl: " ++ url

        Timeout ->
            "Timeout"

        NetworkError ->
            "NetworkError"

        BadStatus _ ->
            "BadStatus"

        BadBody s ->
            "BadBody: " ++ s


focusSearchBox : Cmd Msg
focusSearchBox =
    Task.attempt (\_ -> NoOp) (Dom.focus "search-box")


stringToNoop : String -> Msg
stringToNoop string =
    NoOp
