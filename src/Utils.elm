module Utils exposing (..)

import Browser.Dom as Dom
import Element exposing (Attribute, Element)
import Http exposing (Error(..))
import Messages exposing (Msg(..))
import Regex
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


regexOrNever : String -> Regex.Regex
regexOrNever regex =
    Maybe.withDefault Regex.never <|
        Regex.fromString regex


getBasePath : String -> String
getBasePath host =
    let
        localIp =
            regexOrNever "192.168.10.147"

        isLocalIp =
            Regex.contains localIp host

        isLocalhost =
            Regex.contains (regexOrNever "localhost") host

        isFunkoa =
            Regex.contains (regexOrNever "funkoa") host

        isAndreWolden =
            Regex.contains (regexOrNever "andrewolden") host
    in
    if isLocalIp then
        "/"

    else if isLocalhost then
        "/"

    else if isFunkoa then
        "/andrewolden/"

    else if isAndreWolden then
        "/"

    else
        "/"
