module Subscriptions exposing (subscriptions)

import Animator
import Browser.Events as E
import Components.ElmCollapse.ElmCollapse exposing (animator1, animator2)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Platform.Sub exposing (batch)
import Ports exposing (messageReceiver)


subscriptions : Model -> Sub Msg
subscriptions model =
    batch
        [ resizeSub
        , messageReceiver RecieveY
        , Animator.toSubscription Tick1 model animator1
        , Animator.toSubscription Tick2 model animator2
        ]


resizeSub : Sub Msg
resizeSub =
    E.onResize (\w h -> Resized)
