module Main exposing (main)

import Browser
import Messages exposing (Msg(..))
import Model exposing (Model, init)
import Platform exposing (Task)
import Update exposing (update)
import View exposing (view)


main : Program Int Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "André Wolden"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
