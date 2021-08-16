module Main exposing (main)

import Browser
import Messages exposing (Msg(..))
import Model exposing (Flags, Model, init)
import Platform exposing (Task)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view =
            \m ->
                { title = "André Wolden"
                , body = [ view m ]
                }
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
