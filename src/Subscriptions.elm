module Subscriptions exposing (subscriptions)

import Animator
import AnimatorExample exposing (animator)
import Browser.Events as E
import Expand.Expand exposing (expandAnimator)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Platform.Sub exposing (batch)
import Ports exposing (messageReceiver)


subscriptions : Model -> Sub Msg
subscriptions model =
    batch
        [ resizeSub
        , messageReceiver RecieveY
        , Animator.toSubscription Tick model animator
        ]


resizeSub : Sub Msg
resizeSub =
    E.onResize (\w h -> Resized)
