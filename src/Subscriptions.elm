module Subscriptions exposing (subscriptions)

import Browser.Events as E
import Messages exposing (Msg(..))
import Model exposing (Model)
import Platform.Sub exposing (batch)
import Ports exposing (messageReceiver)


subscriptions : Model -> Sub Msg
subscriptions model =
    batch
        [ resizeSub
        , messageReceiver RecieveY
        ]


resizeSub : Sub Msg
resizeSub =
    E.onResize (\w h -> Resized)
